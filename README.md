# libtins-sniff-example
Sniff TCP packets example with libtins

# Compile
```
$ g++ main.cpp -o main -std=c++11 -Wl,-rpath,/usr/local/lib -ltins
```

macOS:
```
$ g++ main.cpp -o main -std=c++11 -I/usr/local/include -L/usr/local/Cellar/libtins/4.2_1/lib -ltins
```
