#!/bin/sh
#
# Copyright 2022 The OpenYurt Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e -x

# disable icmp redirect
[ "$(cat /proc/sys/net/ipv4/conf/all/send_redirects)" = 0 ] || echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects

# run raven agent
exec agent --node-name="$NODE_NAME" --vpn-driver="$VPN_DRIVER" --forward-node-ip="$FORWARD_NODE_IP"
