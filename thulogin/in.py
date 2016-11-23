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
    print the_page

name= sys.argv[1]
passwd = sys.argv[2]
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
getReq(url, data)

url2 = 'http://net.tsinghua.edu.cn/rad_user_info.php'
getReq(url2, data)

