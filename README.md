# xm_wanandroid_flutter


app：项目的主工程，存放业务逻辑代码、 UI 页面和 Bloc，还有 styles、colors 等等。
domain：实体类（entity）组件包，还有一些接口类，如 repository、usercase等。
data：数据提供组件包，主要有：api_request，database、shared_preference等，该组件包所有的调用实现都在 domain 中接口 repository 的实现类 repository_impl 中。
shared：工具类组件包，包括：util、helper、enum、constants、exception、mixins等等。
resources：资源类组件包，有intl、公共的images等
initializer：模块初始化组件包。
widgets：公共的 UI 组件包，如常用的：alert、button、toast、slider 等等。

https://juejin.cn/post/7350876924393422886?searchId=2025061117361507E0BE7803FC756BC5F0

