<p align="center" >
  <img src="" alt="LOGO暂缺" title="LOGO暂缺">
</p>

# CRCityPicker
城市选择器

    仿美团实现,也是项目需求驱动。
    一直以来致力于封装一套满足于项目多样化需求的静态库,第一次做开源项目。
    希望大家能带给入门的小伙伴一些启发。
    基本上基于原声Objective-C开发,保证简单、易用、易拓展。
    绝对一句话调用, 不含任何添加剂。
    T.T,当然你可以根据自己需求放置添加剂,高内聚低耦合放心用！
    
    Copyright@2015 Roger Abyss
    任超,IOS研发工程师     重庆, 现任IOS研发部负责人


#### USEAGE 使用

    // 申明
    @property (nonatomic, strong) CRCityPicker* picker;
    
    __block CRCityPicker* weakPicker = _picker;
    
    // 一句话调用
    _picker = [CRCityPicker showFromViewController:self choose:^(CRCity* city){
        NSLog(@"Choose: %@",city.name);
        
        //消失, 避免循环引用  
        [weakPicker dismiss];
    }];
