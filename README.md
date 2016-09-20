# IHFSideBar

IHFSideBar 是一个弹出侧边栏（类似抽屉效果）的控件。
类似qq侧边栏效果已经很漂亮了，那这个控件为什么诞生呢？最主要原因就是类似qq侧边栏接入老项目比较困难，要设置一个ContentView和Left和rightView，然而IHFSideBar只会弹出到当前视图的最前面，无论什么时候接入都没问题。

****
使用方法
****

####1.创建一个SideBar####

```
self.sideBar = [[IHFSideBar alloc] init];
```
> 直接init的话会使IsShowFromRight为NO，也就是侧边栏从左边弹出.

如果要从右边弹出,代码如下设为YES
```
self.sideBar = [[IHFSideBar alloc] initWithIsShowFromRight:YES];
```
####2. 设置SideBar 里面的内容####

```
- (void)setContentView:(UIView *)contentView;
```

例子：
```
CGFloat kSlideBarWidth = 270;
// Create Content of SideBar
UIView *sideBarContentview =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSlideBarWidth, self.view.frame.size.height)];
UIButton *button = [[UIButton alloc] init];
// add a button in contentView
button.frame = CGRectMake(30, 30, 30, 30);
button.backgroundColor = [UIColor redColor];[sideBarContentview addSubview:button];
[button addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];   
sideBarContentview.backgroundColor = [UIColor lightGrayColor];

[self.sideBar setContentViewInSideBar:sideBarContentview];
```

####3.sideBar的出现与消失####
正常情况我们调用出现
```
- (void)show;
```

默认为需要动画和弹出在最前面的控制器中，也可以
```
- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated;
```
设置弹出在哪个控制器上和是否需要动画效果

消失的话 当点击超出sideBar范围的就会消失，如果我们要主动消失，调用
```
- (void)dismiss;
```
是否需要动画调用
```
- (void)dismissAnimated:(BOOL)animated;
```

>总结：上面三部就出现使用侧边栏，也可以控制侧边栏的弹出位置，在侧边栏的弹出与消失中，我们有弹出和消失的代理
- (void)sideBar:(IHFSideBar *)sideBar didAppear:(BOOL)animated;
- (void)sideBar:(IHFSideBar *)sideBar willAppear:(BOOL)animated;
- (void)sideBar:(IHFSideBar *)sideBar didDisappear:(BOOL)animated;
- (void)sideBar:(IHFSideBar *)sideBar willDisappear:(BOOL)animated;

简书地址：http://www.jianshu.com/p/792e4a80b611