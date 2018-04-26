#!/usr/bin/env python                                                                                                                                                                                                                                       
"""
# Author: XU Kui
# Created Time : Tue 23 May 2016 10:04:31 PM CST
 
# File Name: in.py
# Description: Login to tsinghua
    
# Example: 
1. Login to the net.tsinghua.edu.cn
 python in.py your_account your_passwd net
"""

import os
import sys
import urllib
import urllib2
import md5

def MD5(str):
    m1 = md5.new()   
    m1.update(str)   
    return m1.hexdigest() 
def getReq(url, data):
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    return the_page, response.info().getheader('Location')


def logininfo(name, passwd):
    url = 'https://info.tsinghua.edu.cn/Login'
    data = {'userName':name, 'password':passwd,'redirect':'NO','x':32,'y':12}
    data = urllib.urlencode(data)
    getReq(url, data)
    url="http://info.tsinghua.edu.cn/prelogin.jsp?result=1"
    data=""
    getReq(url, data)
    url="http://info.tsinghua.edu.cn/minichan/roamaction.jsp?mode=local&id=2002"
    data=""
    html, location=getReq(url, data)
    print location
    url="http://info.tsinghua.edu.cn/minichan/roamaction.jsp?mode=local&id=2003"
    data=""
    getReq(url, data)
    url="http://info.tsinghua.edu.cn/minichan/roamaction.jsp?mode=local&id=2005"
    data=""
    getReq(url, data)
    url="http://info.tsinghua.edu.cn/minichan/roamaction.jsp?mode=local&id=2006"
    data=""
    getReq(url, data)
    os.system("/usr/bin/open http://info.tsinghua.edu.cn/render.userLayoutRootNode.uP")

def loginlearn(name, passwd):
    url = 'https://id.tsinghua.edu.cn/do/off/ui/auth/login/post/fa8077873a7a80b1cd6b185d5a796617/0?/j_spring_security_thauth_roaming_entry'
    data = {'i_user':name, 'i_pass':passwd}
    data = urllib.urlencode(data)
    getReq(url, data)
    os.system("/usr/bin/open http://learn.cic.tsinghua.edu.cn/f/student/myspace?locale=zh_CN")

def loginnet(name, passwd):
    passwdmd5 = "{MD5_HEX}"+MD5(passwd)
    url = 'https://net.tsinghua.edu.cn/do_login.php'
    
    
    values = {
    'action':'login',
    'username':name,
    'password': passwdmd5,
    'ac_id':1
    }
    data = urllib.urlencode(values)
    #print data
    html, location =  getReq(url, data)
    print html
    
    url2 = 'http://net.tsinghua.edu.cn/rad_user_info.php'
    html, location =  getReq(url2, data)
    print html

name= sys.argv[1]
passwd = sys.argv[2]
site = sys.argv[3]
if site =="net":
    loginnet(name, passwd) 
elif site =="learn":
    loginlearn(name, passwd)
elif site =="info":
    logininfo(name, passwd)
