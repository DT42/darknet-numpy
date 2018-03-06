#include "image.h"

image ndarray_to_image(unsigned char* src, long* shape, long* strides)
{
    int h = shape[0];
    int w = shape[1];
    int c = shape[2];
    int step_h = strides[0];
    int step_w = strides[1];
    int step_c = strides[2];
    image im = make_image(w, h, c);
    int i, j, k;
    int index1, index2 = 0;

    for(i = 0; i < h; ++i){
        for(k= 0; k < c; ++k){
            for(j = 0; j < w; ++j){
                index1 = k*w*h + i*w + j;
                index2 = step_h*i + step_w*j + step_c*k;
                im.data[index1] = src[index2]/255.;
            }
        }
    }
    rgbgr_image(im);
    return im;
}
