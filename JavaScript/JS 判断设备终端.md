JS判断设备终端（PC，iPad，iPhone，android，winPhone）和浏览器

var ua = navigator.userAgent;
        var browser = {},
            weixin = ua.match(/MicroMessenger\/([^\s]+)/i),
            webkit = ua.match(/WebKit\/([\d.]+)/i),
            android = ua.match(/(Android)\s+([\d.]+)/i),
            ipad = ua.match(/(iPad).*OS\s([\d_]+)/i),
            ipod = ua.match(/(iPod).*OS\s([\d_]+)/i),
            iphone = !ipod && !ipad && ua.match(/(iPhone\sOS)\s([\d_]+)/i),
            webos = ua.match(/(webOS|hpwOS)[\s\/]([\d.]+)/i),
            touchpad = webos && ua.match(/TouchPad/i),
            kindle = ua.match(/Kindle\/([\d.]+)/i),
            silk = ua.match(/Silk\/([\d._]+)/i),
            blackberry = ua.match(/(BlackBerry).*Version\/([\d.]+)/i),
            mqqbrowser = ua.match(/MQQBrowser\/([\d.]+)/i),
            chrome = ua.match(/CriOS\/([\d.]+)/i),
            opera = ua.match(/Opera\/([\d.]+)/i),
            safari = ua.match(/Safari\/([\d.]+)/i);
