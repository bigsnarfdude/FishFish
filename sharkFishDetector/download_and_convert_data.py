# Copyright 2016 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
r"""Downloads and converts a particular dataset.

Usage:
```shell


$ python download_and_convert_data.py \
    --dataset_name=fish \
    --dataset_dir=/tmp/fish
```
"""
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import tensorflow as tf

from datasets import download_and_convert_fish

FLAGS = tf.app.flags.FLAGS

tf.app.flags.DEFINE_string(
    'dataset_name',
    None,
    'The name of the dataset to convert "fish".')

tf.app.flags.DEFINE_string(
    'dataset_dir',
    None,
    'The directory where the output TFRecords and temporary files are saved.')


def main(_):
  if not FLAGS.dataset_name:
    raise ValueError('You must supply the dataset name with --dataset_name')
  if not FLAGS.dataset_dir:
    raise ValueError('You must supply the dataset directory with --dataset_dir')

  elif FLAGS.dataset_name == 'fish':
    download_and_convert_fish.run(FLAGS.dataset_dir)
  else:
    raise ValueError(
        'dataset_name [%s] was not recognized.' % FLAGS.dataset_dir)

if __name__ == '__main__':
  tf.app.run()

