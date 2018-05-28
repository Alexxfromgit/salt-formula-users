users:
  redhat:
    fullname: Test
    home: /home/redhat
    uid: 2000
    gid: 100
    groups:
      - users
      - root
    sudouser: Ture
    keys_dir: salt://tests
    ssh_auth: centos.pub
    ssh_keys:
      - centos.pem
      - ubuntu.pem

absent_users:
  - canonical
