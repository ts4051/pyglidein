#!/usr/bin/env bash
ROOT_DIR=/groups/icecube/icecube/cluster
PATH=$ROOT_DIR/anaconda/anaconda2/bin:$PATH
source activate pyglidein
PYTHONPATH=$ROOT_DIR/pyglidein:$PYTHONPATH
python $ROOT_DIR/pyglidein/pyglidein/client.py --config=$ROOT_DIR/pyglidein/configs/nbi.config --secrets=$ROOT_DIR/pyglidein/configs/nbi.secrets
