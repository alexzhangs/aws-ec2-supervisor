# aws-ec2-supervisor

Install supervisor on AWS EC2 instance.

## Get code

```
sudo yum install -y git
git clone https://github.com/alexzhangs/aws-ec2-supervisor.git
```

## Install supervisor

Default installation:

```
sudo bash aws-ec2-supervisor/aws-ec2-supervisor-install.sh
```

Install an additional init.d script, so can use `service supervisord
<start|stop>` to control supervisor daemon, this is the most case to
use.

```
sudo bash aws-ec2-supervisor/aws-ec2-supervisor-install.sh -i
```

Install a specific version available in pip:

```
sudo bash aws-ec2-supervisor/aws-ec2-supervisor-install.sh -v 4.0.3
```
