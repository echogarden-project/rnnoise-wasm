PROJ=rnnoise

EMCCFLAGS=-s ALLOW_MEMORY_GROWTH=1 -s MAXIMUM_MEMORY=4GB -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_rnnoise_get_size', '_rnnoise_get_frame_size', '_rnnoise_init', '_rnnoise_create', '_rnnoise_destroy', '_rnnoise_process_frame']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -s EXPORT_ES6=1 -s EXPORT_NAME="RNNoise"

all: rnnoise/src/celt_lpc.c rnnoise/src/denoise.c rnnoise/src/kiss_fft.c rnnoise/src/pitch.c rnnoise/src/rnn.c rnnoise/src/rnn_data.c
	emcc $(EMCCFLAGS) -O3 -o $(PROJ).js -I rnnoise/include $^

.PHONY: clean
clean:
	rm -f $(PROJ).js $(PROJ).wasm
