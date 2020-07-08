#!/usr/bin/expect -f
# When expect exits, it sends a SIGHUP (hangup signal) to the spawned subprocess. By default, this SIGHUP causes termination of the spawned process.
# We do not want the ssh tunnel to die from SIGHUP. So, we ask expect to make the process ignore SIGHUP in the spawn line
set timeout 120
spawn -ignore HUP ./jumphostlogin.sh
expect {
      "Are you sure you want to continue connecting*" {
            send "yes\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(jh1_ssh_private_key)'*" {
            send -- "$env(jh1_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(jh2_ssh_private_key)'*" {
            send -- "$env(jh2_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(jh3_ssh_private_key)'*" {
            send -- "$env(jh3_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(jh4_ssh_private_key)'*" {
            send -- "$env(jh4_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(jh5_ssh_private_key)'*" {
            send -- "$env(jh5_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(bjh1_ssh_private_key)'*" {
            send -- "$env(bjh1_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(bjh2_ssh_private_key)'*" {
            send -- "$env(bjh2_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(bjh3_ssh_private_key)'*" {
            send -- "$env(bjh3_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(bjh4_ssh_private_key)'*" {
            send -- "$env(bjh4_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(bjh5_ssh_private_key)'*" {
            send -- "$env(bjh5_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*Enter passphrase for key*$::env(endpoint_ssh_private_key)'*" {
            send -- "$env(endpoint_ssh_private_key_passphrase)\r"
            exp_continue
      }
      "*DONEDONEDONE*" {
        send_user "spawned process backgrounding successful\n"
        #expect_background
        interact
      }
}
exit 0
