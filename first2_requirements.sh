#install relative packages
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler 
sudo apt-get install --no-install-recommends libboost-all-dev 
sudo apt-get install libopenblas-dev liblapack-dev libatlas-base-dev 
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt install cmake
sudo apt-get install python-numpy
sudo apt-get install python3-numpy
sudo apt-get install protobuf-c-compiler protobuf-compiler
sudo apt-get install git 
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler 
sudo apt-get install --no-install-recommends libboost-all-dev 
sudo apt-get install libatlas-base-dev 
sudo apt-get install python3.5-dev 
sudo apt-get insall libgflags-dev libgoogle-glog-dev liblmdb-dev

#install cuda-8.0
sudo dpkg -i ./caffe_ssd_install/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
sudo echo 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
sudo echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
sudo -s source ~/.bashrc

#install cudnn-5.0.5
sudo cp /home/jhx/cuda/include/cudnn.h /usr/local/cuda/include/
sudo cp /home/jhx/cuda/lib64/libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
cd /usr/local/cuda/lib64/
sudo rm -rf libcudnn.so libcudnn.so.5
sudo ln -s libcudnn.so.5.0.5 libcudnn.so.5 
sudo ln -s libcudnn.so.5 libcudnn.so

#install opencv-3.4.5
cd /home/jhx/opencv-3.4.5
sudo rm -rf ./build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release\
	  -DCMAKE_INSTALL_PREFIX=/usr/local\
	  -DPYTHON3_E:XECUTABLE=/usr/bin/python3\
	  -DPYTHON_INCLUDE_DIR=/usr/include/python3.5\
	  -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.5m.so\
	  -DPYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.5/dist-packages/numpy/core/include\
	  -DPYTHON3_NUMPY_VERSION=1.16.2\
	  -DINSTALL_PYTHON_EXAMPLES=ON\
	  -DINSTALL_C_EXAMPLES=OFF\
	  -DPYTHON_EXECUTABLE=/usr/lib/python3\
	  -DBUILD_EXAMPLES=ON ..
make 
sudo make install
sudo cp /home/jhx/CAFFE-GPU-INSTALL/OpenCV.conf /etc/ld.so.conf.d/
sudo ldconfig


#install caffe
cd /home/jhx/caffe  #the path of caffe download directory
sudo make clean
sudo make all
sudo make runtest
sudo make pycaffe
sudo echo PYTHONPATH="/home/jhx/caffe/build/python">>~/.bashrc
source ~/.bashrc












