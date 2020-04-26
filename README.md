# gradle_moprei21_mt_exercise03


## Changes  

Order of commands that were used:
forking repo and cloning inside repo  
```
git clone https://github.com/moprei21/pytorch-rnn
```
  
creating virualenv and activation
```
./scripts/make_virtualenv.sh
source venvs/torch3/bin/activate
```

installing packages
```
./scripts/install_packages.s
```

changing download file from to download new file according to chosen text and then downlading data:
```
./scripts/download_data.sh
```
 training the new data and changing the hyperparamter --emsize and --nhid as show in the following table
 ```
./scripts/train.sh
```
| Embedding size        | Text perplexity           |
| --------------------- |:-------------------------:|
| 25                    |      217.09               |
| 50                    |      202.98               |
| 400                   |      181.39               |
| 500                   |      178.10               |
| 300                   |      173.66               |
| 150                   |      172.36               |
| 100                   |      171.53               |
| 200                   |      171.05               |

generating a sample with the hyperparameter that delivers the lowest text perplexity
```
./scripts/generate.sh
```

Thanks very much for this exercise !  
It was a lot of fun and really interesting to do 


