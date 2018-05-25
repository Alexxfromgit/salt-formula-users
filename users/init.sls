{% from "users/map.jinja" import users with context %}

{{ users.user }}:
  user.present:
    - fullname: {{ users.fullname }}
    - home: {{ users.home }}
    - uid: {{ users.uid }}
    - gid: {{ users.gid }}
    - groups:
      {% for group in users.get('groups', []) -%}
      - {{ group }}
      {% endfor %}

{{ users.rmuser }}:
  user.absent

{% if 'sudouser' in users %}
/etc/sudoers.d/{{ users.user }}:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      user_name: {{ users.user }}
{%- endif %}

sshkeys:
  ssh_auth.present:
    - user: {{ users.user }}
    - source: {{ users.key }}
