# Locales role for Ansible

Installs the specified locales and language packs. By default, we set the locale to ['straya](https://www.google.com.au/maps/place/Australia/@-26.4390743,133.281323,4z/data=!3m1!4b1!4m2!3m1!1s0x2b2bfd076787c5df:0x538).

## Requirements

Tested on Ubuntu 12.04 Server.

## Role Variables

The default variables are as follows:

    locale: 'en_AU'
    encoding: 'UTF-8'
    locales_user: '{{ ansible_ssh_user }}'
    locale_language_packs:
      - 'language-pack-en'
      - 'language-pack-en-base'

## Example Playbook

    - hosts: 'servers'
      roles:
        - role: 'ssilab.locales'
	      locale: 'en_AU'
	      encoding: 'UTF-8'
	      locales_user: 'hercules'

# License

This playbook is provided 'as-is' under the conditions of the BSD license. No fitness for purpose is guaranteed or implied.