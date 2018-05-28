{% from "users/map.jinja" import users with context %}

{% for name, user in pillar.get('users', {}).items() %}
{{ name }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    - home: {{ user['home'] }}
    {% if 'shell' in user -%}
    - shell: {{ user['shell'] }}
    {% else %}
    - shell: /bin/bash
    {% endif %}
    {% if 'uid' in user -%}
    - uid: {{ user['uid'] }}
    {% endif -%}
    {% if 'gid' in user -%}
    - gid: {{ user['gid'] }}
    {% endif -%}
    - groups:
      {% for group in user.get('groups', []) -%}
      - {{ group }}
      {% endfor %}

{% if 'sudouser' in user %}
/etc/sudoers.d/{{ name }}:
  file.managed:
  - source: salt://users/templates/sudoers.d.jinja2
  - template: jinja
  - context:
    user_name: {{ name }}
{% endif %}

{% if 'keys_dir' in user %}
{% if 'ssh_auth' in user %}
sshkey_{{ name }}:
  ssh_auth.present:
    - user: {{ name }}
    - source: {{ user['keys_dir'] }}/{{ user['ssh_auth'] }}
{% endif %}

{% if 'ssh_keys' in user %}
{% for key in user.get('ssh_keys', []) -%}
add_{{ key }}:
  file.managed:
    - name: {{ user['home'] }}/.ssh/{{ key }}
    - source: {{ user['keys_dir'] }}/{{ key }}
{% endfor %}
{% endif %}
{% endif %}

{% endfor %}

{% for rmuser in pillar.get('absent_users', []) %}
user_remove_{{ rmuser }}:
  user.absent:
    - name: {{ rmuser }}
    - purge: True
    - force: True
  file.absent:
    - name: /etc/sudoers.d/{{ rmuser }}
{% endfor %}
