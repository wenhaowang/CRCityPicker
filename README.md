<p align="center" >
  <img src="" alt="LOGO暂缺" title="LOGO暂缺">
</p>

# CRCityPicker

我的目标是: 一句话调用,不用你思考!

    Copyright@2015 Roger Abyss
    任超    IOS研发工程师
    重庆主城区 
    Contact: roger_ren@qq.com

===============
>仿美团实现的城市选择器,也是项目需求驱动。<br />
>一直以来致力于封装一套满足于项目多样化需求的静态库,第一次做开源项目。希望大家能带给入门的小伙伴一些启发。<br />
>基本上基于原声Objective-C开发,保证简单、易用、易拓展。绝对一句话调用, 不含任何添加剂。<br />
>T.T,当然你可以根据自己需求放置添加剂,高内聚低耦合放心用！<br /><br />

>然而我并没有做完! <br />
>数据还没有下来,我先做WIFI电话去了...白白~<br />
>公司好多需求压着,后台写哪里的接口我就去做哪里,应该近期会开始做。<br />


===============
#### USEAGE 使用

===============
>1.核心类CRCityPicker,考虑到历史城市的选择,所以单例实现。<br />
>2.直接出现在window层,不需考虑View遮挡问题。<br />
>3.注释明确,便于大家使用。<br />
>4.测试IOS7.1极其以上通过, 使用AutoLayout+SizeClasses,支持大屏模式。<br />
>5.过渡动画自定义。<br />

    #import "CRCityPicker.h"
    // 申明
    @property (nonatomic, strong) CRCityPicker* picker;
    
    __block CRCityPicker* weakPicker = _picker;
    
    // 一句话调用
    _picker = [CRCityPicker showFromViewController:self choose:^(CRCity* city){
        NSLog(@"Choose: %@",city.name);
        
        //消失, 避免循环引用  
        [weakPicker dismiss];
    }];
    






===============
#### HOTCITY 热门城市

===============
>1.使用此方法时,会自动调用动画<br />
>2.可以自定义动画,这里使用了基于阻尼运动的弹性动画<br />

    // 1.支持本地热门城市  使用本地数据
    // 2.支持网络热门城市  使用网络数据
    // 3.支持取消热门城市  使用空数组,热门城市极其相关会自动隐藏,无任何副作用
    _picker.cityPickerViewController.cityData = @[];





===============
#### HISTORY 历史选择

===============
>1.动画效果及调用,与热门城市相同<br />
>2.历史记录管理任你喜欢,FMDB、Core Data、Plist..处理逻辑与缓存策略分离，放心！<br />
>3.自己可替换为了方便可以直接使用plist<br />

    // 1.支持本地热门城市  使用本地数据
    // 2.支持网络热门城市  使用网络数据
    // 3.支持取消热门城市  使用空数组,热门城市极其相关会自动隐藏,无任何副作用
    _picker.cityPickerViewController.cityData = @[];






===============
#### Location 历史选择

===============
>1.如果你们的app已经有统一的Location Manger, 给一个指针<br />
>2.默认有自己的定位系统<br />

    // 当然,如果你喜欢可以完全分离出定位模块直接给结果就好
    _picker.cityPickerViewController.locationName = @"正在定位中...不要着急";








===============
#### DATA 数据处理

===============
>给大家的建议,数据处理最好全部给服务端,反正我不会拿个手机跟别人电脑主机比处理速度。
当然你说你们家服务端不会...那我没办法了...<br /><br />

>1.现将数据处理成标准格式,至于怎么处理你们自己随便怎么搞,别出人命就好!<br />
>2.数据段不给力还是自己用个三方库,转区域全拼、简拼，未雨绸缪下一步就是数据检索了。<br />
>3.数据全部已经建模,需要特殊字段自己动手,丰衣足食<br />

    // 申明数据转化器, 你可以拓展此类以满足你的特殊需求
    @property (nonatomic, strong) CRCityDataTransformer* dataTransformer;
  
    // 数据就是 _dataTransformer的data了, 这里是本地数据
    // 当然如果数据标准这些东西你都不需要操心,数据格式Demo里面有
    _dataTransformer = [CRCityDataTransformer generateCityListFromLocal]






===============
#### 数据检索

===============
>这里给大家的建议是,空间换时间!<br />
上面数据处理的时候就存好这里需要的字段,不要查找的时候再用三方库转拼音了,你不累处理器累。<br /><br />

>1.精确查找    匹配string<br />
>2.模糊查找    匹配全拼音、简拼、五笔<br />
