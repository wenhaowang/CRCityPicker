<p align="center" >
  <img src="" alt="LOGO暂缺" title="LOGO暂缺">
</p>

# CRCityPicker
城市选择器

    仿美团的城市选择器。
    需求驱动,一直以来致力于封装一套满足于项目多样化需求的静态库。第一次做开源项目。
    基本上基于原声Objective-C开发，保证简单，易用，易拓展，绝对一句话调用，无需考虑其他任何因素。

Copyright@2015 Roger Abyss


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
