#!/bin/zsh

GETWEBPROXY=`networksetup -getwebproxy "Wi-Fi" | rg 'Enabled: No'` 
GETSECUREWEBPROXY=`networksetup -getsecurewebproxy "Wi-Fi" | rg 'Enabled: No'` 

if [[ $GETWEBPROXY == "Enabled: No" ]] && [[ $GETSECUREWEBPROXY == "Enabled: No" ]]; then
  networksetup -setwebproxystate "Wi-Fi" on
  networksetup -setsecurewebproxystate "Wi-Fi" on
else
  networksetup -setwebproxystate "Wi-Fi" off
  networksetup -setsecurewebproxystate "Wi-Fi" off
fi

networksetup -setairportpower en0 off
sleep 2
networksetup -setairportpower en0 on
