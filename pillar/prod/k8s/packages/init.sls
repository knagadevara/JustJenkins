kube_version: "v1.28.4"

kube_dl_pth: "https://dl.k8s.io/"

master:
  kube-controller-manager:
    hash: "a6c1e82431b6e9b045a8feb713fc14a4a6fa168a3d3edf91c63a496c8bcd0133"

  kube-apiserver:
    hash: ad57ac6e7fea9ef8f5de172b9984795d91d4353ea1badf3883161e9a8fdeda58

  kube-scheduler:
    hash: a13001593c8cfdfa3896f54267fd778a944ac6a6d41aff53b672b9f118aa4112

  apiextensions-apiserver:
    hash: dd6c2ee893f99e20a7f34f8b1017f5534a15d59772d67d4e7648e814c9cd8e9e

  kube-aggregator:
    hash: 7d817fe7368dd8dd0d7b00e968ff4e6808d3ddf591535b2c1c25c4316259a0b4

common:
  kubectl:
    hash: edf1e17b41891ec15d59dd3cc62bcd2cdce4b0fd9c2ee058b0967b17534457d7

  kubelet:
    hash: bf203989dd9b3987b8a0d2331dcce6319f834b57df810fafba5a4805d54823ac

  kube-proxy:
    hash: 34db8fe1ebb87c9e081b172672301927c8cd35f667720ef2aa9f647700f579c1
