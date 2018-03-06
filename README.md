Make Darknet to support numpy array as input.

# How to Use

```
$ git clone https://github.com/pjreddie/darknet
$ git clone https://gitlab.com/DT42/marvin42/darknet-numpy
$ cd darknet-numpy
$ ./patch_darknet ../darknet
$ cd ../darknet
$ # Manual action: Prepare tiny-yolo model
$ # Manual action: Update Makefile configuration if needed
$ # Manual action: Install python3-numpy package if needed
$ make  # use -j <cpu-number> to speedup compilation
$ make -f Makefile.numpy
$ python3 darknet_npinput.py
```
