Make Darknet to support numpy array as input.

To prevent us from maintaining a diverged repo, we make numpy support
as independent plugin w/o touching Darknet's source codes.

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

References

* https://gitlab.com/DT42/galaxy42/dt42-trainer/issues/30
