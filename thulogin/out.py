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


