# Android decompiler!
A simple bash script to decompile android apps.

## Installation
Clone it:
```bash
$ git clone https://github.com/TheYahya/android-decompile.git
```

Change current directory to the `android-decompile`. Yes! It's a part of installation :)
```bash
$ cd android-decompile
```

Install dependencies:
Only if you haven't `java` on your machine! which is impossible if you're android developer :)
But if you haven't, It will do with the `openjdk`, Which on ubuntu would be like this:
```bash
$ apt-get install openjdk-9-jre
```

And make `decompile.sh` executable:
```bash
$ chmod +x decompile.sh 
```
**Congratulation**, It's done.

## Usage
Copy all your apk files into `apk/` dir, then just run the `decompile.sh`:
```bash
$ ./decompile.sh
```
and check out the `result/` dir.

## License
[MIT](https://github.com/TheYahya/android-decompile/blob/master/LICENSE) License