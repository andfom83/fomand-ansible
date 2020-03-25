RBD mapping
=========

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

    rbd_path: vmimages/all
    rbd_name: client.rbd
    new_ocfs2_nodes: 
      - 192.168.0.49
    basic_ocfs2_node: 192.168.0.4


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

- hosts: all
  vars:
    rbd_path: vmimages/all
    rbd_name: client.rbd
    new_ocfs2_nodes: 
      - 192.168.0.49
    basic_ocfs2_node: 192.168.0.4
  roles:
  - rbd
  - ocfs2



License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
