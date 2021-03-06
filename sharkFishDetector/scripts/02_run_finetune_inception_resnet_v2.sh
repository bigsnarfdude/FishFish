
# Where the pre-trained Inception_ResNet_V2 checkpoint is saved to.
PRETRAINED_CHECKPOINT_DIR=/tmp/checkpoints/inception_resnet_v2

# Where the training (fine-tuned) checkpoint and logs will be saved to.
TRAIN_DIR=/tmp/fish-models/inception_resnet_v2

# Where the dataset is saved to.
DATASET_DIR=/tmp/fish



# Fine-tune only the new layers for 1000 steps.
python train_image_classifier.py \
  --train_dir=${TRAIN_DIR} \
  --dataset_name=fish \
  --dataset_split_name=train \
  --dataset_dir=${DATASET_DIR} \
  --model_name=inception_resnet_v2 \
  --checkpoint_path=${PRETRAINED_CHECKPOINT_DIR}/inception_resnet_v2_2016_08_30.ckpt \
  --checkpoint_exclude_scopes=InceptionResnetV2/Logits,InceptionResnetV2/AuxLogits  \
  --trainable_scopes=InceptionResnetV2/Logits,InceptionResnetV2/AuxLogits  \
  --max_number_of_steps=1000 \
  --batch_size=16 \
  --learning_rate=0.01 \
  --learning_rate_decay_type=fixed \
  --save_interval_secs=60 \
  --save_summaries_secs=60 \
  --log_every_n_steps=100 \
  --optimizer=rmsprop \
  --weight_decay=0.00004

# Run evaluation.
python eval_image_classifier.py \
  --checkpoint_path=${TRAIN_DIR} \
  --eval_dir=${TRAIN_DIR} \
  --dataset_name=fish \
  --dataset_split_name=validation \
  --dataset_dir=${DATASET_DIR} \
  --model_name=inception_resnet_v2
