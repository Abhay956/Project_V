# Project V

In this setup, we have used the following open-source DevOps tools.

- Docker
- Prometheus
- Alert Manager
- Grafana
- Prometheus Node Exporter
- Terraform

Following are the AWS services used.

- ec2

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
### Configure Grafana Dashboards

Now we need to add prometheus URL as the data source from Connections→ Add new connection→ Prometheus → Add new data source

![image](https://github.com/Abhay956/Project_V/assets/132220412/6fe5d23d-04d1-463c-8d7f-5c79ec88e48f)


To import a Grafana dashboard, go to Dashboards –> Create Dashboard –> Import Dashboard –> Type 10180 and click load –> Select Prometheus Data source –> Import
![Screenshot_1](https://github.com/Abhay956/Project_V/assets/132220412/32f1d8fc-6a6d-4ec4-a61b-bbe61a97fdc3)


Test: High Storage & CPU Alert
```bash
dd if=/dev/zero of=testfile_16GB bs=1M count=16384; openssl speed -multi $(nproc --all) &
```

```bash
rm testfile_16GB && kill $(pgrep openssl)
```
