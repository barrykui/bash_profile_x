#!/usr/bin/env python                                                                                                                                                                                                                                       
"""
# Author: XU Kui
# Created Time : Tue 23 May 2016 10:04:31 PM CST
 
# File Name: in.py
# Description: Logout the net.tsinghua.edu.cn
    
# Example: 
 python out.py
"""

import urllib
import urllib2
def getReq(url, data):
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page


url = 'https://net.tsinghua.edu.cn/do_login.php'
values = {
'action':'logout',
}
data = urllib.urlencode(values)
print data
getReq(url, data)


