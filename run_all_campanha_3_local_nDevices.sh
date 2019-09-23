#!/bin/bash
cd '/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29'
rm -rf /home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices 2>/dev/null
mkdir -p /home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=1000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=1 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=2000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=1 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=3000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=1 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=4000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=1 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=5000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=1 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=6000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=1 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=1000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=2 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=2000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=2 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=3000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=2 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=4000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=2 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=5000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=2 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=6000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=2 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=1000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=3 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=2000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=3 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=3000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=3 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=4000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=3 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=5000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=3 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=6000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=3 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=1000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=4 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=2000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=4 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=3000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=4 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=4000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=4 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=5000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=4 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=6000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=4 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=1000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=5 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=2000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=5 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=3000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=5 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=4000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=5 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=5000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=5 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
NS_GLOBAL_VALUE="RngRun=16184102690484" ./waf --run 'ADR_code --radius=2000 --nDevices=6000 --simulationTime=600 --appPeriodSeconds=600 --print=false --fixedSeed=false --algoritmo=5 --filename=DadosLora_1_job --outputDir='/home/gppcom/ns_3_lora/ns-3-lora-gppcom/ns-allinone-3.29/ns-3.29/results_local_nDevices'' & wait
