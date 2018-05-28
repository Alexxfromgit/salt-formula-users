# users

Formula to create, delete and configure users via pillar.

## Usage

Crete users by:
```yaml
users:
  auser:
    # configuration
    
  buser:
    # configuration
```

Minimal required values for creating user:
```yaml
users:
  auser:
    fullname: Minimum Values
    home: /home/auser
```

Delete user by:
```yaml
absent_users:
  - auser
  - buser
```
Such things can configured:
  - fullname
  - home directory
  - uid, gid
  - groups
  - sudo without password
  - ssh authorized keys
  - ssh keys that will be moved to ~/.ssh
  
## Examples

Pillar examples for ubuntu and centos placed in /tests/pillars/users.

