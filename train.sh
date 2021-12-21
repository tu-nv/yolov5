#!/bin/bash
# LOSS_TYPES="giou wgiou diou wdiou ciou wciou" ./train.sh


MODEL="yolov5s"
DATA="coco.yaml"

loss_types=($LOSS_TYPES)

for LOSS_TYPE in "${loss_types[@]}"; do
    python train.py --data $DATA \
        --cfg ${MODEL}.yaml --weights '' \
        --batch-size 64 \
        --name ${LOSS_TYPE}_${MODEL} \
        --loss-type ${LOSS_TYPE}
done
