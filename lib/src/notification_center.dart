
//  Created by WHC on 18/12/25.
//  Copyright © 2018年 WHC. All rights reserved.
//
//  Github <https://github.com/netyouli/Flutter-NotificationCenter>
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

class NotificationCenter {
    static NotificationCenter _default = new NotificationCenter();
    var _observerMap = new Map();
    final _segmentKey = '-888-';
    
    /**
     * 发送通知
     * name 通知名称
     * param 通知参数
     */
    static void post(String name, [Object param]) {
        if (name != null) {
            NotificationCenter._default._observerMap.forEach((key, value){
                final array = key.split(NotificationCenter._default._segmentKey);
                if (array.length == 2) {
                    final _name = array[0];
                    if (_name == name && value != null) {
                        value(param);
                    }
                }
            });
        }else {
            print('[Notification] post name not null');
        }
    }

    /**
     * 监听通知
     * observer 监听对象
     * name 监听的通知名称
     * block 监听通知的回调
     */
    static void addObserver(Object observer, 
                            String name, 
                            [void block(Object param)]) {
        if(observer != null && name != null) {
            final key = name + NotificationCenter._default._segmentKey + observer.hashCode.toString();
            NotificationCenter._default._observerMap[key] = block;
        }else {
            print('[Notification] observer not null or name not null');
        }
    }


    /**
     * 移除通知
     * observer 要移除的对象
     * name 要移除的通知名称（如果为空则移除observer下所有通知）
     */
    static void removeObserver(Object observer, [String name]) {
        if (observer != null) {
            if (name != null) {
                final key = name + NotificationCenter._default._segmentKey + observer.hashCode.toString();
                NotificationCenter._default._observerMap.remove(key);
            }else {
                final keys = NotificationCenter._default._observerMap.keys;
                final List<String> keysToRemove = [];
                
                for (var key in keys) {
                    final array = key.split(NotificationCenter._default._segmentKey);
                    if (array.length == 2) {
                        final hasCode = array[1];
                        if (hasCode == observer.hashCode.toString()) {
                            keysToRemove.add(key);
                        }
                    }
                }
                
                NotificationCenter._default._observerMap.removeWhere((key, value) => keysToRemove.contains(key));
            }
        }
    }
}
