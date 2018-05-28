users:
  canonical:
    fullname: Test
    home: /home/canonical
    uid: 2000
    gid: 100
    groups:
      - users
      - root
    sudouser: True
    keys_dir: salt://tests
    ssh_auth: ubuntu.pub
    ssh_keys:
      - ubuntu.pem
      - centos.pem

absent_users:
  - redhat

