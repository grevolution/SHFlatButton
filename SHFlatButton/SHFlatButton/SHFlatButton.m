// TSFlatButton.m
//
// Copyright (c) 2014 Shan Ul Haq (http://grevolution.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


#import "SHFlatButton.h"

@interface SHFlatButton ()

@property(nonatomic) UIEdgeInsets defaultEdgeInsets;
@property(nonatomic) UIEdgeInsets normalEdgeInsets;
@property(nonatomic) UIEdgeInsets highlightedEdgeInsets;

@end

@implementation SHFlatButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultEdgeInsets = self.titleEdgeInsets;
    }
    return self;
}

- (void) setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    [super setTitleEdgeInsets:titleEdgeInsets];
    self.defaultEdgeInsets = titleEdgeInsets;
    [self setShadowHeight:self.shadowHeight];
}

- (void) setHighlighted:(BOOL)highlighted {
    UIEdgeInsets insets = highlighted ? self.highlightedEdgeInsets : self.normalEdgeInsets;
    [super setTitleEdgeInsets:insets];
    [super setHighlighted:highlighted];
}

- (void) setShadowHeight:(CGFloat)shadowHeight {
    _shadowHeight = shadowHeight;
    UIEdgeInsets insets = self.defaultEdgeInsets;
    insets.left += shadowHeight;
    insets.bottom += shadowHeight;
    self.highlightedEdgeInsets = insets;
    insets.left -= shadowHeight * 2.0f;
    insets.bottom -= shadowHeight * 2.0f;
    self.normalEdgeInsets = insets;
    [super setTitleEdgeInsets:insets];
}

- (void)configureButton {
    self.backgroundColor = [UIColor clearColor];
    UIView *mainView = [self viewWithRect:self.bounds];
    
    CGRect rect = self.bounds;
    rect.origin.y += self.shadowHeight;
    rect.size.height -= self.shadowHeight;
    rect.size.width -= self.shadowHeight;
    UIView *background = [self viewWithRect:rect];
    background.backgroundColor = self.buttonColor;
    [background setUserInteractionEnabled:NO];
    [mainView addSubview:background];
    
    CGRect shadowRect;
    shadowRect.origin.x = rect.size.width;
    shadowRect.origin.y = rect.origin.y - self.shadowHeight/2;
    shadowRect.size.width = self.shadowHeight;
    shadowRect.size.height = rect.size.height;
    
    UIView *shadow = [self viewWithRect:shadowRect];
    shadow.backgroundColor = self.shadowColor;
    [shadow setUserInteractionEnabled:NO];
    shadow.transform = CGAffineTransformMake(1.0, -1.0, 0.0, 1.0, 0.0, 0.0);
    [mainView addSubview:shadow];
    
    
    UIView *pressedView = [self viewWithRect:self.bounds];
    
    CGRect pRect = self.bounds;
    pRect.origin.x += _shadowHeight;
    pRect.size.width -= _shadowHeight;
    pRect.size.height -= _shadowHeight;
    UIView *pView = [self viewWithRect:pRect];
    
    UIColor *highlightedColor = self.highlightedColor ? self.highlightedColor : self.buttonColor;
    [pView setBackgroundColor:highlightedColor];
    [pressedView addSubview:pView];
    
    if(self.disabledColor) {
        UIView *disabledMainView = [self viewWithRect:self.bounds];
        CGRect rect = self.bounds;
        rect.origin.y += self.shadowHeight;
        rect.size.height -= self.shadowHeight;
        UIView *disabledView = [self viewWithRect:rect];
        disabledMainView.backgroundColor = self.disabledColor;
        [disabledMainView addSubview:disabledView];
        
        UIImage *disabledImage = [self imageWithView:disabledMainView];
        [self setBackgroundImage:disabledImage forState:UIControlStateDisabled];        
    }
    
    UIImage *normal = [self imageWithView:mainView];
    UIImage *highlighted = [self imageWithView:pressedView];

    [self setBackgroundImage:normal forState:UIControlStateNormal];
    [self setBackgroundImage:highlighted forState:UIControlStateHighlighted];
}

#pragma mark - Helper Function

- (UIView *)viewWithRect:(CGRect)rect {
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor clearColor];
    view.opaque = NO;
    return view;
}

- (UIImage *) imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - Property Accessors and Mutators

- (void) setButtonColor:(UIColor *)buttonColor {
    _buttonColor = buttonColor;
    [self configureButton];
}

- (void) setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    [self configureButton];
}

- (void) setHighlightedColor:(UIColor *)highlightedColor {
    _highlightedColor = highlightedColor;
    [self configureButton];
}

- (void) setDisabledColor:(UIColor *)disabledColor {
    _disabledColor = disabledColor;
    [self configureButton];
}

@end
