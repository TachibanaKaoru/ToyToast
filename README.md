# ToyToast

Simple Toast in Swift.

## Install

* Drag and Drop ToyToast/ToyToastViewController.swift file into your project.

## Usage

* use just like other UIViewController

```
        var mytoast : ToyToastViewController = ToyToastViewController(
            title:"Lorem ipsum",
            message:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:ColorStyle.DarkGray)
        
        self.presentViewController(mytoast,
            animated: true,
            completion: nil)

```

## ScreenShot
![DarkGray Screenshot](https://raw.github.com/toyship/ToyToast/master/screens/DarkGray.png)
![LightGray Screenshot](https://raw.github.com/toyship/ToyToast/master/screens/LightGray.png)
![White Screenshot](https://raw.github.com/toyship/ToyToast/master/screens/White.png)

## License
MIT LICENSE
