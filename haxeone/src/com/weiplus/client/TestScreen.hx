package com.weiplus.client;

import nme.display.Shape;
import com.roxstudio.haxe.ui.RoxNinePatch;
import com.roxstudio.haxe.ui.RoxAsyncBitmap;
import nme.events.Event;
import com.eclecticdesignstudio.spritesheet.AnimatedSprite;
import com.eclecticdesignstudio.spritesheet.data.BehaviorData;
import com.eclecticdesignstudio.spritesheet.data.SpritesheetFrame;
import com.eclecticdesignstudio.spritesheet.Spritesheet;
import com.roxstudio.haxe.ui.UiUtil;
import nme.text.TextField;
import nme.text.TextFormat;
import com.roxstudio.haxe.ui.RoxButton;
import com.roxstudio.haxe.game.ImageUtil;
import nme.display.BitmapData;
import nme.display.Bitmap;
import nme.geom.Matrix;
import nme.filters.DropShadowFilter;
import com.roxstudio.haxe.game.GameUtil;
import com.roxstudio.haxe.ui.RoxNinePatch;
import nme.geom.Rectangle;
import nme.display.Sprite;
import com.roxstudio.haxe.ui.RoxScreen;

using com.roxstudio.haxe.ui.UiUtil;

class TestScreen extends BaseScreen {

    private var prevTime: Int;
    private var prog: Array<AnimatedSprite>;

    public function new() {
        super();
        title = new Sprite();
//        title.addChild(new Bitmap(ImageUtil.getBitmapData("res/icon_logo.png")).rox_smooth());
        title.addChild(new TextField().rox_label("测试标题", new TextFormat().rox_textFormat(0xFF0000, 36), false));
    }

    override public function onCreate() {
        super.onCreate();
        var bg = new RoxNinePatch(ImageUtil.getNinePatchData("res/btn_common.9.png"));
        addTitleButton(new RoxButton(new Bitmap(ImageUtil.getBitmapData("res/icon_single_column.png")), bg), UiUtil.RIGHT);
    }

    override public function createContent(height: Float) : Sprite {
        var content = new Sprite();
//        var bmd = GameUtil.loadBitmapData("res/btn_red.png");
//        graphics.beginBitmapFill(bmd, new Matrix(0.5, 0, 0, 0.5, 20, 20), true, true);
//        graphics.drawRoundRect(0, 0, bmd.width, bmd.height, 20);
//        graphics.endFill();

//        var bmp = new Bitmap(bmd);
//        var s = new Sprite().rox_button("res/btn_red.png");
//        var nine = new RoxNinePatch(GameUtil.loadBitmapData("res/btn_play.png"), new Rectangle(48, 20, 214, 60));
//        var nine = RoxNinePatch.fromAndroidNinePng(GameUtil.loadBitmapData("res/shadow6.9.png"));
//        nine = new RoxNinePatch(GameUtil.loadBitmapData("res/shadow6_1.png"), nine.ninePatchGrid);
//        nine.setDimension(bmd.width + 2, bmp.height + 4);

//        nine.rox_move(99, 99);
//        addChild(nine);
//        bmp.rox_move(100, 100);
//        addChild(bmp);
//        var format = new TextFormat().rox_textFormat(0, 36);
//        var txt = new TextField().rox_label("测试按钮", format, false);
//        var bg = ImageUtil.getNinePatch("res/btn_common.9.png");
//        var sp = new RoxButton(null, null, UiUtil.CENTER, new Bitmap(ImageUtil.getBitmapData("res/icon_home.png")).rox_smooth(), txt, bg, UiUtil.VCENTER);
//        sp.rox_scale(2);
//        sp.rox_move(screenWidth / 2, height / 2);
//        content.addChild(sp);

        content.addChild(UiUtil.rox_button("res/icon_message.png", function(e) {trace(e.target.name + " clicked");}).rox_move(100, 100));
        content.addChild(UiUtil.rox_button("res/clock.png", "CLOCK", 0xFFFFFF, 32, UiUtil.HCENTER, function(e) {trace(e.target.name + " clicked");}).rox_move(100, 200));
        content.addChild(UiUtil.rox_button("res/icon_time.png", "三分钟之前", 0, 20, function(e) {trace(e.target.name + " clicked");}).rox_move(100, 480));

        var tf = new TextField().rox_label("测试阴影", new TextFormat().rox_textFormat(0xFF0000, 50), false);
//        tf.filters = [ new DropShadowFilter(4.0, 45.0, 0, 0.3) ];
        content.addChild(tf);//.rox_move(100, 600));
        var shape = new Shape();
        shape.graphics.beginFill(0xFF0000);
        shape.graphics.drawRect(0, 0, 60, 40);
        shape.graphics.endFill();
        tf.mask = shape;
        content.addChild(shape);
//        var sheet = new Spritesheet(ImageUtil.getBitmapData("res/progress.png"));
//        var frames: Array<Int> = [];
//        for (i in 0...12) {
//            sheet.addFrame(new SpritesheetFrame(100 * i, 0, 100, 100));
//            frames.push(i);
//        }
//        sheet.addBehavior(new BehaviorData("loading", frames, true, 10, 50, 50));
//        prog = [];
//        var xx = [ 1, -1, 1, -1 ], yy = [ 1, 1, -0.8, -0.8 ];
//        for (i in 0...4) {
//            prog[i] = new AnimatedSprite(sheet);
//            prog[i].showBehavior("loading");
//            prog[i].transform.matrix = new Matrix(xx[i], 0, 0, yy[i], 0, 0);
//            content.addChild(prog[i].rox_move(200, 200 + 120 * i));
//        }
//        addEventListener(Event.ENTER_FRAME, update);
//        sp.addChild(new Bitmap(ImageUtil.getBitmapData("res/content2.jpg")));
//        trace("before scale: " + sp.width +","+sp.height);
//        sp.x = 100;
//        sp.y = 150;
//        sp.width = 200;
//        sp.height = 150;
//        addChild(sp);
//        trace("after scale: " + sp.width +","+sp.height);

//        this.filters = [ new DropShadowFilter(4.0, 45.0, 0, 0.3) ];

//        var remote = new RoxAsyncBitmap("http://img.my.csdn.net/uploads/201212/19/1355883342_4474.png");
//        content.addChild(remote.rox_move(100, 300));
        return content;
    }

    private function update(e) {
        var currTime = nme.Lib.getTimer();
        var deltaTime: Int = currTime - prevTime;
        for (i in 0...4) prog[i].update(deltaTime);
        prevTime = currTime;
    }

}
