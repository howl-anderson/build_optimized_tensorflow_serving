1.15.0.tar.gz:
	wget https://github.com/tensorflow/serving/archive/1.15.0.tar.gz
	tar xzvf 1.15.0.tar.gz  # will get a dir called serving-1.15.0

.PHONY: build_CPU_devel_image
build_CPU_devel_image: 1.15.0.tar.gz
	(cd serving-1.15.0; docker build --pull -t ${USER}/tensorflow-serving-devel -f tensorflow_serving/tools/docker/Dockerfile.devel .)

.PHONY: build_CPU_image
build_CPU_image: build_CPU_devel_image
	(cd serving-1.15.0; docker build -t ${USER}/tensorflow-serving --build-arg TF_SERVING_BUILD_IMAGE=${USER}/tensorflow-serving-devel -f tensorflow_serving/tools/docker/Dockerfile .)