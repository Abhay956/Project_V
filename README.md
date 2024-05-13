# Project V

A brief description of what this project does and who it's for

![project V](https://github.com/Abhay956/Project_V/assets/132220412/68ed5a94-063d-47d3-a6d4-d8814c71effa)


## Run Locally

Clone the project

```bash
git clone https://github.com/Abhay956/Project_V.git
cd Project_V
```

Create Ec2 instance

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

Take ssh of created instance

```bash
ssh root@ip-address
```

Clone the project

```bash
git clone https://github.com/Abhay956/Project_V.git
cd Project_V
```
Update server IP in prometheus configuration file

```bash
make all
```

Deploy Prometheus, Alert manager, Node exporter and Grafana using Docker-compose

```bash
docker-compose up -d
```
To import a Grafana dashboard, go to Dashboards –> Create Dashboard –> Import Dashboard –> Type 10180 and click load –> Select Prometheus Data source –> Import

Test: High Storage & CPU Alert
```bash
dd if=/dev/zero of=testfile_16GB bs=1M count=16384; openssl speed -multi $(nproc --all) &
```
