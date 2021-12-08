# Legend
#   RunSeed: 0
#   Seed: 1
#   Algoritmo: 2
#   Radius: 3
#   nDevices: 4
#   appPeriodSeconds:5
#   simulationTime:6
#   PHYTotal: 7
#   PHYSuccessful:8 
#   PHYInterfered: 9
#   PHYNoMoreReceivers: 10
#   PHYUnderSensitivity: 11
#   PHYLostBecauseTX: 12
#   SimulationDuration: 13

import warnings
warnings.filterwarnings("ignore")
import numpy as np
import matplotlib.pylab as plt
from itertools import cycle
import scipy.stats as st
import os
import argparse
import yaml
import matplotlib
from random import randint   
import itertools

# New plots
#import matplotlib
# Fix on matplotlib issue with backend
#matplotlib.use('Agg')
#import matplotlib.pyplot as plt
plt.style.use('seaborn-white')

class openSimulation:
    def __init__(self, configurations_file):
        self.email_to = 'fulano@gmail.com'            
        with open(configurations_file, 'r') as f:
            self.doc = yaml.load(f, Loader=yaml.loader.BaseLoader)
        self.campaign_name = os.path.splitext(configurations_file)[0]
        
        # Read commom parameters
        self.showPlot = True;
        self.plotCI = True;                
        self.campaignX = self.doc['scenario']['campaignX']
        self.campaignLines = self.doc['scenario']['campaignLines'][0]
        self.simLocation = str(doc['scenario']['simLocation'])
        self.simulationTime = self.doc['scenario']['simulationTime']
        self.nDevices = self.doc['scenario']['nDevices']
        self.nDevices = list(map(float,self.nDevices))
        self.radius = self.doc['scenario']['radius']
        self.radius = list(map(float,self.radius))
        self.appPeriodSeconds = self.doc['scenario']['appPeriodSeconds']
        self.bPrint = (self.doc['scenario']['bPrint'])
        self.fixedSeed = (self.doc['scenario']['fixedSeed'])
        self.Algoritmo = self.doc['scenario']['algoritmo']
        self.ns3_path = str(self.doc['scenario']['ns3_path'])
        #self.ns3_path = os.getcwd() + '/' + self.ns3_path
        self.ns3_script = str(self.doc['scenario']['ns3_script'])
        self.nJobs = int(self.doc['scenario']['jobs'])
        if self.nJobs == 1: # disable the confidence interval
            self.plotCI = False;
        self.filename = str(self.doc['scenario']['filename'])
        self.targetRealocation  = self.doc['scenario']['targetRealocation']
        
    def doLabelalgoritmo(self, algID):
        # Define labels for plots legends
        if algID == '1':
            return "SF7 (I)"
        elif algID == '2':
            return "SF 12 (II)"
        elif algID == '3':
            return "Equal Split (III)"
        elif algID == '4':
            return "Proposed for Capacity (IV)"
        elif algID == '5':
            return "Proposed for Coverage (V)"
        elif algID == '6':
            return "Sensitivity-based (VI)"
        elif algID == '7':
            return "Proposed sensitivity-based for Capacity (VII)"
        elif algID == '8':
            return "Proposed sensitivity-based for Coverage (VIII)"
        elif algID == '9':
            return "Random ADR (IX)"
        
    def doLabeltargetRealocation(self, realocRate):
        # Define labels for plots legends
        return "Real. = "+realocRate+" %"
        
    def plotCampaign(self,curCampaign, metric):
        # some general configurations
        #outputDir = self.ns3_path+'/results_'+self.simLocation + '_' + curCampaign
        outputDir = self.ns3_path+'/results_'+self.filename+'_' + curCampaign
        chFile = outputDir+ "/" + self.filename + '.txt'        
        print(chFile)
        simTime = np.loadtxt(chFile, skiprows=1, usecols=(6, ), delimiter=',', unpack=False)                
        resalgoritmo = np.loadtxt(chFile, skiprows=1, usecols=(2, ), delimiter=',', unpack=False)
        restargetRealocation = np.loadtxt(chFile, skiprows=1, usecols=(14, ), delimiter=',', unpack=False)
        resradius = np.loadtxt(chFile, skiprows=1, usecols=(3, ), delimiter=',', unpack=False)
        resnDevices = np.loadtxt(chFile, skiprows=1, usecols=(4, ), delimiter=',', unpack=False)
        ressimDur = np.loadtxt(chFile, skiprows=1, usecols=(13, ), delimiter=',', unpack=False)
        resphyTotal = np.loadtxt(chFile, skiprows=1, usecols=(7, ), delimiter=',', unpack=False)
        resphySucc = np.loadtxt(chFile, skiprows=1, usecols=(8, ), delimiter=',', unpack=False)
        markers_on_all = cycle(list(itertools.product([0], [1,2,3,4,5])))
        markersA = cycle(('o', 'v', 'D', '>', 'P', '^', '*', '<', 's', 'H', 'D', 'd'))
        lineA = cycle(('-', '--',  '-', '--', '-', '--', '-', '--', '-', '--', '-','--'))
        colors = cycle(('b', 'g', 'r', 'c', 'm', 'y', 'k'))      
        
        plt.figure()
        fig, ax = plt.subplots()
        ax.set_facecolor("white")
        
        #for iAlg in self.algoritmo:
        for curLine in self.doc['scenario'][self.campaignLines]: 
            m_pdr, m_pdrCI, m_tput, m_tputCI, m_pkt, m_pktCI = [], [], [], [], [], []
            color=next(colors)
            marker=next(markersA)
            line=next(lineA)
            markers_on=next(markers_on_all)
            #label = self.doLabel(iAlg)            
            label = eval('self.doLabel'+self.campaignLines+'(str(curLine))')
            # Current values of line metrics'
            curMetricLine = eval('res'+self.campaignLines)
            resxData = eval('sorted(self.'+curCampaign+',key=int)')             
            
            for varParam in sorted(self.doc['scenario'][curCampaign],key=int):                
                
                # Current values of y-axis metrics
                curMetricAxis = eval('res'+curCampaign)
                resalgIndexs = (curMetricLine == int(curLine)) & (curMetricAxis == int(varParam))                
                                
                if str(curCampaign) == 'radius':
                    #resalgIndexs = (resalg == int(iAlg)) & (resradius == int(varParam))
                    chtitle = 'Settings ('+ self.doc['scenario']['nDevices'][0] +' devices)'
                    xlabel='Distance [m]'
                    #resxData = sorted(self.radius,key=int) 
                    # label = self.doLabel(iAlg)
                elif str(curCampaign) == 'nDevices':
                #    resalgIndexs = (resalg == int(iAlg)) & (resnDevices == int(varParam))                    
                    xlabel='Number of Devices'
                    chtitle = 'Settings (radius = '+ self.doc['scenario']['radius'][0] +' m)'
                #    resxData = sorted(self.nDevices,key=int)
                #    label = self.doLabel(iAlg)
                elif str(curCampaign) == 'targetRealocation':
                #    resalgIndexs = (resalg == int(iAlg)) & (restargetRealocation == int(varParam))                    
                    xlabel='Taxa de realocação [%]'
                    chtitle = 'Configuração ('+ self.doc['scenario']['nDevices'][0] +' dispositivos, raio = '+ self.doc['scenario']['radius'][0]+')'
                #    resxData = self.targetRealocation
                                        
                # Pdr Evaluation
                if metric=='PDR':                
                    # Calculate PDR line
                    pdr = 100*( resphySucc[resalgIndexs]  / resphyTotal[resalgIndexs])
                    m_pdr = np.append(m_pdr, np.mean(pdr))
                    # Confidence interval according to https://stackoverflow.com/questions/15033511/compute-a-confidence-interval-from-sample-data
                    l, h = st.t.interval(0.95, len(pdr)-1, loc=np.mean(pdr), scale=st.sem(pdr))
                    #l,h = st.norm.interval(0.95, loc=np.mean(pdr), scale=st.sem(pdr))                                                            
                    m_pdrCI = np.append(m_pdrCI, h)
                elif metric=='Tput':
                    # TODO
                    # Calculate Tput line
                    tput = 8*23*( resphySucc[resalgIndexs] ) / float(self.simulationTime)
                    m_tput = np.append(m_tput, np.mean(tput))
                    # Confidence interval according to https://stackoverflow.com/questions/15033511/compute-a-confidence-interval-from-sample-data
                    l, h = st.t.interval(0.95, len(tput)-1, loc=np.mean(tput), scale=st.sem(tput))
                    #l,h = st.norm.interval(0.95, loc=np.mean(tput), scale=st.sem(tput))                    
                    m_tputCI = np.append(m_tputCI, h)
                
            alpha = 0.2    
            # Plot line
            if metric=='PDR':                         
                #plt.plot(resxData,m_pdr, label=label, marker=marker,color=color,markevery=markers_on)   
                plt.plot(resxData,m_pdr, label=label, marker=marker,color=color,markevery=markers_on,ls=line,markersize=8.5)   
                err=(m_pdrCI-m_pdr)
                plt.fill_between(resxData, (m_pdr-err), (m_pdr+err), alpha=alpha)
                #if bool(self.plotCI):
                    #plt.errorbar(resxData,m_pdr, yerr=(m_pdrCI-m_pdr), color=color, ls = 'none', marker=marker, lw = 2, capthick = 2,markevery=markers_on)
                    
            elif metric=='Tput':
                # TODO
                #plt.plot(resxData,m_tput, label=label, marker=marker,color=color,markevery=markers_on) 
                plt.plot(resxData,m_tput, label=label, marker=marker,color=color,markevery=markers_on,ls=line,markersize=8.5) 
                err=(m_tputCI-m_tput)
                plt.fill_between(resxData, (m_tput-err), (m_tput+err), alpha=alpha)
                
                #if bool(self.plotCI):                
                #    plt.errorbar(resxData,m_tput, yerr = (m_tputCI-m_tput), marker=marker,color=color, ls = 'none', lw = 2, capthick = 2,markevery=markers_on)
            
            
        # Plot figure
        params = {'legend.fontsize': 'x-large',
         'axes.labelsize': 'x-large',
         'axes.titlesize':'x-large',
         'xtick.labelsize':'x-large',
         'ytick.labelsize':'x-large'}
        plt.rcParams.update(params)        
        os.makedirs(outputDir+"/ps", exist_ok=True)
        os.makedirs(outputDir+"/png", exist_ok=True)
        
        if metric=='PDR':        
            # Show and save PDR plot
            ylabel="PDR [%]"
            if bool(self.plotCI):
                imgfilename = 'PDR_CI_'+curCampaign
            else:
                imgfilename = 'PDR_'+curCampaign
        elif metric=='Tput':
            # Show and save PDR plot
            ylabel="Throughput [bps]"
            if bool(self.plotCI):
                imgfilename = 'TPUT_CI_'+curCampaign
            else:
                imgfilename = 'TPUT_'+curCampaign    
        
        # Plot general configuration
        nPixels = 500
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(chtitle)
        #plt.legend(loc='best', numpoints=1) 
        #plt.tight_layout()
        lgd = plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))
        plt.grid()
        #box = ax.get_position()
        #ax.set_position([0.1, 0.1, box.width, box.height])
        #print(box)
        
        plt.savefig(outputDir+"/png/"+imgfilename+".png",
                    dpi=nPixels,
                    bbox_extra_artists=(lgd,),
                    bbox_inches='tight')
                   
        #plt.savefig(outputDir+"/ps/"+imgfilename+".eps")
        #if bool(self.showPlot):
        #    plt.show()
        #else:
        #    plt.close()
                
               
        
parser = argparse.ArgumentParser()
parser.add_argument("-f", "--file", type=str, help='Configuration File')
args = parser.parse_args()

configurations_file = args.file; 
with open(configurations_file, 'r') as f:
    doc = yaml.load(f, Loader=yaml.loader.BaseLoader)
    campaign_name = os.path.splitext(configurations_file)[0]

# print(doc)
print('Simulação escolhida: ')
campaign = doc['scenario']['campaignX']
print(campaign)
                 
simu = openSimulation(configurations_file)
for iMet in ['PDR', 'Tput']:
    for simC in campaign:
        if str(simC) == 'nDevices' or str(simC) == 'radius' or str(simC) == 'targetRealocation':
            simu.plotCampaign(simC,iMet);
        else:
            print('Invalid simulation campaign: verify the campaign parameter!')
