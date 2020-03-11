# libtins-sniff-example
Sniff TCP packets example on port 80 with libtins.

# Compile
Before compiling, install [libtins](http://libtins.github.io/download/).

After you have installed libtins, type this command (for Unix system):
```
$ make
```

# Run (with Testing)
Type this command to run (need `sudo` privilege):
```
$ sudo ./libtins_sniff_example <network interface>
```

Open another terminal and type these:
```
$ curl google.com
$ curl wololo.net
```



To stop the program, press `Ctrl+C`.
The TCP payload is in `output.txt`.

# Redirect cout to file
https://stackoverflow.com/questions/10150468/how-to-redirect-cin-and-cout-to-files
