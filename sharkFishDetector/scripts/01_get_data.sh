
# Where the pre-trained Inception_ResNet_V2 checkpoint is saved to.
PRETRAINED_CHECKPOINT_DIR=/tmp/checkpoints/inception_resnet_v2

# Where the training (fine-tuned) checkpoint and logs will be saved to.
TRAIN_DIR=/tmp/fish-models/inception_resnet_v2

# Where the dataset is saved to.
DATASET_DIR=/tmp/fish

mkdir -p /tmp/checkpoints/inception_resnet_v2/

# Download the pre-trained checkpoint.
if [ ! -d "$PRETRAINED_CHECKPOINT_DIR" ]; then
  mkdir ${PRETRAINED_CHECKPOINT_DIR}
fi
if [ ! -f ${PRETRAINED_CHECKPOINT_DIR}/inception_resnet_v2_2016_08_30.ckpt ]; then
  wget http://download.tensorflow.org/models/inception_resnet_v2_2016_08_30.tar.gz
  tar -xvf inception_resnet_v2_2016_08_30.tar.gz
  mv inception_resnet_v2_2016_08_30.ckpt ${PRETRAINED_CHECKPOINT_DIR}/inception_resnet_v2_2016_08_30.ckpt
  rm inception_resnet_v2_2016_08_30.ckpt
fi

# Download the dataset
python download_and_convert_data.py \
  --dataset_name=fish \
  --dataset_dir=${DATASET_DIR}
