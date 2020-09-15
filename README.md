# CitrixPlayground
Testing citrix products

## Run
```docker-compose up --force-recreate```

## Netscaler / ADC CPX
```https://docs.citrix.com/en-us/citrix-adc-cpx/12/deploy-using-docker-image-file.html```

### Connect via SSH
Check which port is exposed as SSH 
```docker ps```

You should see something like this under PORTS
```0.0.0.0:32806->22/tcp```
Then ssh to this port 
```ssh -p 32806 nsroot@localhost```

