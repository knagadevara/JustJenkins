server_type: "Production Server"
message: "Beaware! Your actions are being monitored"
app_version: 10.0.1
github_url: "https://github.com"
dl_path: "/srv/kubernetes/"
sys_arch: "arm64"
network_details:
  domain_name: "PRD.ZONE"
  dns:
    - 192.168.64.1
    - 8.8.8.8
    - 8.8.4.4
  net_addr:
    core: 192.168.64.0/24
  cfg_node:
    01:
      ip_addr: 192.168.64.6 
      host_name: CFG-192_168_64_6
  k8s_mgr:
    01:
      ip_addr: 192.168.64.7
      host_name: RH-K8S-MGR01-192168647
    02:
      ip_addr: 192.168.64.8
      host_name: RH-K8S-MGR01-192168648
  k8s_wkr:
    01:
      ip_addr: 192.168.64.9
      host_name: RH-K8S-WKR01-192168649
    02:
      ip_addr: 192.168.64.10
      host_name: RH-K8S-WKR02-1921686410
    03:
      ip_addr: 192.168.64.11
      host_name: RH-K8S-WKR03-1921686411

