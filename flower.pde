/*************
Thiết kế giao diện
Giao diện có màu sắc hài hoà, layout hợp lý và nội dung rõ ràng.
Chúng ta sẽ có một ngôi nhà nhỏ xinh với 1 cửa chính và 2 cửa sổ
Phía trước ngôi nhà là một vườn hoa với nhiều sắc màu chủng loại khác nhau
Phía trên vẫn là bầu trời xanh mây trắng

Yêu cầu chức năng cơ bản
Vẽ một ngôi nhà nhiều hoa lá.

Vẽ được ngôi nhà có cửa sổ cửa chính, có mái nhà, có lối vào nhà
Phía trước nhà cần vẽ được vườn hoa
Phía trên ngôi nhà là bầu trời và mây bay
Click vào hoa thì hoa có thể lớn lên được
Số lượng hoa và vị trí hoa xuất hiện là ngẫu nhiên trong phạm vi từ 5-10
Hãy tạo ra ít nhất 5 loại hoa
Mỗi loại hoa cần có màu sắc kích thước và vị trí khác nhau
Hãy vẽ thêm đám cỏ ở phía dưới cây hoa (click vào cỏ thì cỏ không lớn lên được)
***************/
noStroke();

/******************
* CÁC BIẾN KIẾN TẠO
******************/
//Kích thước Canvas
var canvas_x = 800;
var canvas_y = 800;
// Biến vòng lập
var i = 0;
var j = 0;
// position of the flower
var x = 10;

void setup()
{
  size(canvas_x ,canvas_y);
  background(125);
}
/*************
* CÁC HÀM HỖ TRỢ
**************/
/******************
*Vẽ trục tọa độ
*******************/
var veTrucToaDo = function () {
  fill (0, 0, 0);
  //Vẽ trục x
  i = 0;
  while (i < canvas_x) {
    text (i, i, 10);
    i+= 50;
  };
  //Vẽ trục y
  i = 0;
  while (i < canvas_x) {
    text (i, 5, i);
    i+= 50;
  };
};

/*************
*OBJECT TYPES
**************/
/******************
*Flower Object Type
*******************/

/*****************
*Tulip Object Type
******************/
var Tulip = function(x, y, height) {
    this.x = x;
    this.y = y;
    this.height = height;
};

Tulip.prototype.draw = function() {
    noStroke();
    fill(16, 122, 12);
    rect(this.x, this.y, 10, -this.height);
    fill(255, 0, 0);
    // petals
    ellipse(this.x+5, this.y-this.height, 44, 44);
    triangle(this.x-16, this.y-this.height,
            this.x+20, this.y-this.height,
            this.x-20, this.y-this.height-31);
    triangle(this.x-14, this.y-this.height,
            this.x+24, this.y-this.height,
            this.x+3, this.y-this.height-39);
    triangle(this.x+-4, this.y-this.height,
            this.x+26, this.y-this.height,
            this.x+29, this.y-this.height-36);
};

Tulip.prototype.growBy = function(amount) {
    this.height += amount;
};

/*********************
*Sunflower Object Type
**********************/
var Sunflower = function(x, y, height) {
    this.x = x;
    this.y = y;
    this.height = height;
}

Sunflower.prototype.draw = function() {

    fill(16, 122, 12);
    rect(this.x, this.y, 10, -this.height);

    // petals
    stroke(0, 0, 0);
    fill(255, 221, 0);
    ellipse(this.x-10, this.y-this.height, 20, 18);
    ellipse(this.x+5, this.y-this.height-15, 20, 18);
    ellipse(this.x+5, this.y-this.height+15, 20, 18);
    ellipse(this.x+20, this.y-this.height, 20, 18);
    fill(20, 20, 20);
    ellipse(this.x+5, this.y-this.height, 20, 20);

};

Sunflower.prototype.growBy = function(amount) {
    this.height += amount;
};
/*********************
*Cúc họa mi Object Type
**********************/
var CucHoaMi = function(x, y, height) {
  this.x = x;
  this.y = y;
  this.height = height;
};

CucHoaMi.prototype.draw = function() {

  //Đặt Biến
  var cucHoaMi_size = 25;
  var cucHoaMi_canhHoa_w = cucHoaMi_size * 0.6;
  var cucHoaMi_canhHoa_h = cucHoaMi_canhHoa_w * 2.67;
  var x = this.x;
  var y = this.y;
  var cucHoaMi_thanCay_h = this.height;

  //thân hoa
  noStroke();
  fill(16, 122, 12);
  rect(this.x, this.y, 10, -this.height);

  noStroke();
  fill(256, 256, 256);
  //4 cánh hoa vuông góc
  ellipse(this.x + 5, this.y - this.height - cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(this.x + 5, this.y - this.height + cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(this.x + 5 - cucHoaMi_size,this.y - this.height, cucHoaMi_canhHoa_h, cucHoaMi_canhHoa_w);
  ellipse(this.x + 5 + cucHoaMi_size,this.y - this.height, cucHoaMi_canhHoa_h, cucHoaMi_canhHoa_w);

  pushMatrix();
  translate(this.x + 5, this.y - this.height);
  rotate(45);
  ellipse(0, -cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(0, cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(0, cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(-cucHoaMi_size, 0, cucHoaMi_canhHoa_h, cucHoaMi_canhHoa_w);
  ellipse(cucHoaMi_size, 0, cucHoaMi_canhHoa_h, cucHoaMi_canhHoa_w);
  popMatrix();

  pushMatrix();
  translate(this.x + 5, this.y - this.height);
  rotate(90);
  ellipse(0, -cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(0, cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(0, cucHoaMi_size, cucHoaMi_canhHoa_w, cucHoaMi_canhHoa_h);
  ellipse(-cucHoaMi_size, 0, cucHoaMi_canhHoa_h, cucHoaMi_canhHoa_w);
  ellipse(cucHoaMi_size, 0, cucHoaMi_canhHoa_h, cucHoaMi_canhHoa_w);
  popMatrix();

  // //nhụy hoa
  fill(255, 178, 102);
  ellipse(this.x + 5, this.y - this.height, cucHoaMi_size, cucHoaMi_size);

};

CucHoaMi.prototype.growBy = function(amount) {
  this.height += amount;
};

/******************
*House Object Type
*******************/
var House = function(x, y, width) {
  this.x = x;
  this.y = y;
  this.width = width;
}

House.prototype.draw = function () {
    /**********
    Đặt biến
    **********/
    /**********************
      Biến cho nền nhà
    **********************/
    var nenNha_w = this.width;
    var nenNha_h = nenNha_w / 8; //50
    var nenNha_x = this.x;
    var nenNha_y = this.y;
    var nenNha_col = nenNha_w / 12;//chiều rộng nền nhà chia 120 phần bằng nhau = 3.33;
    var nenNha_row = nenNha_h / 3;//chiều cao nền nhà chia 3 phần bằng nhau

    //Biến bậc thềm
    var bacThem_h = nenNha_h / 3;
    var bacThem_w = nenNha_col * 3;
    var bacThem_x = nenNha_x + (nenNha_w / 2) - (bacThem_w / 2);
    var bacThem_y = nenNha_y + 2;

    /**********************
      Biến cho thân nhà
    **********************/
    var thanNha_w = nenNha_col * 8;
    var thanNha_h = nenNha_row * 8;
    var thanNha_x = nenNha_x + nenNha_col * 2;
    var thanNha_y = nenNha_y - thanNha_h;

    //Biến thanh đà ngang
    var thanhDa_w = thanNha_w;
    var thanhDa_h = nenNha_row * 2;
    var thanhDa_x = thanNha_x;
    var thanhDa_y = thanNha_y;

    //Biến cửa chính
    var cuaChinh_w = nenNha_col;
    var cuaChinh_h = thanNha_h - thanhDa_h;
    var cuaChinh_x = nenNha_x + nenNha_col * 5;
    var cuaChinh_y = nenNha_y - cuaChinh_h;

    //Biến tay nắm
    var tayNam_w = cuaChinh_w / 10;
    var tayNam_h = cuaChinh_h / 9;
    var tayNam_trai_x = thanNha_x + thanNha_x / 2 - thanNha_x / 28;
    var tayNam_phai_x = thanNha_x + thanNha_x / 2 + thanNha_x / 28;
    var tayNam_y = cuaChinh_y + cuaChinh_h / 2 - tayNam_h /2;

    //Biến cửa sổ
    var cuaSo_w = nenNha_col * 2;
    var cuaSo_h = cuaSo_w * 0.75;
    var cuaSo_trai_x = thanNha_x + nenNha_col * 0.5;
    var cuaSo_phai_x = thanNha_x + nenNha_col * 5.5;
    var cuaSo_y = thanNha_y + thanhDa_h;
    var cuaSo_phai_y = thanNha_y + thanhDa_h;

    /**********************
      Biến cho mái nhà
    **********************/
    var maiNha_duoi_x1 = thanNha_x;
    var maiNha_duoi_y1 = thanNha_y - thanNha_h / 2;
    var maiNha_duoi_x2 = maiNha_duoi_x1 + thanNha_w;
    var maiNha_duoi_y2 = thanNha_y - thanNha_h / 2;
    var maiNha_duoi_x3 = maiNha_duoi_x2 + nenNha_col * 3;
    var maiNha_duoi_y3 = thanNha_y;
    var maiNha_duoi_x4 = thanNha_x - nenNha_col * 3;
    var maiNha_duoi_y4 = maiNha_duoi_y3;

    var maiNha_tren_w = thanNha_w;
    var maiNha_tren_h = thanNha_h / 3;
    var maiNha_tren_x = maiNha_duoi_x1;
    var maiNha_tren_y = maiNha_duoi_y1 - maiNha_tren_h;

    /**********************
      Biến cột nhà
    **********************/
    var cotNha_w = nenNha_col * 0.5;
    var cotNha_h = thanNha_h;
    var cotNha_x = nenNha_x;
    var cotNha_y = nenNha_y - cotNha_h;

    /******************
    *House Object Function
    *******************/

  /****Thân nhà****/
  noStroke();
  fill(232, 198, 165);
  rect(thanNha_x, thanNha_y, thanNha_w, thanNha_h);
  //Thanh đà
  noStroke();
  fill(148, 100, 53);
  rect(thanhDa_x, thanhDa_y, thanhDa_w, thanhDa_h);
  /***Cửa chính***/
  //Cửa chính x 2
  strokeWeight(5);
  stroke(37, 44, 48);
  fill(171, 147, 123);
  for (i = cuaChinh_x; i < cuaChinh_x + nenNha_col * 1.5; i += nenNha_col) {
  rect(i, cuaChinh_y, cuaChinh_w, cuaChinh_h);
  }
  //Tay nắm cửa chính x 2
  noStroke();
  fill(217, 217, 217);
  rect(tayNam_trai_x, tayNam_y, tayNam_w, tayNam_h);
  rect(tayNam_phai_x, tayNam_y, tayNam_w, tayNam_h);
  /***Cửa sổ***/
  //Cửa sổ x 2
  strokeWeight(5);
  stroke(37, 44, 48);
  fill(248, 255, 201);
  rect(cuaSo_trai_x, cuaSo_y, cuaSo_w, cuaSo_h);
  rect(cuaSo_phai_x, cuaSo_y, cuaSo_w, cuaSo_h);
  /****Nền nhà****/
  noStroke();
  fill(224, 221, 224);
  rect(nenNha_x, nenNha_y, nenNha_w, nenNha_h);
    /***Bậc tam cấp***/
    //3 bậc thang
    fill (255, 128, 0);
    strokeWeight(1);
    stroke (0, 0, 0);
    rect(bacThem_x - nenNha_col * 0, bacThem_y, bacThem_w, bacThem_h);
    rect(bacThem_x - nenNha_col * 0.5, bacThem_y + bacThem_h * 1, bacThem_w + nenNha_col * 1, bacThem_h);
    rect(bacThem_x - nenNha_col * 1, bacThem_y + bacThem_h * 2, bacThem_w + nenNha_col * 2, bacThem_h);

  /****Mái nhà****/
    //Mái trên hình chữ nhật
    noStroke();
    fill(256, 0, 0);
    rect(maiNha_tren_x, maiNha_tren_y, maiNha_tren_w, maiNha_tren_h);
    //Mái dưới hình thang, cạnh trên mái dưới là cạnh dưới mái trên
    noStroke();
    fill(256, 0, 0);
    quad(maiNha_duoi_x1, maiNha_duoi_y1, maiNha_duoi_x2, maiNha_duoi_y2, maiNha_duoi_x3, maiNha_duoi_y3, maiNha_duoi_x4, maiNha_duoi_y4);
  /****Cột****/
    //Cột x 4
    noStroke();
    fill(146, 124, 101);
    for(i = cotNha_x; i < cotNha_x + nenNha_col * 12; i += nenNha_col * 11.5) {
    rect(i, cotNha_y, cotNha_w, cotNha_h);
    };
/****Trang trí****/
  /***Lồng đèn***/
  /***Trong nhà***/
}


/**************
*MAIN PROGRAM
***************/

/** create object instances **/
var tulip = new Tulip(38, 750, 150);
var sunflower = new Sunflower(186, 750, 100);
var house = new House(200, 400, 300);
var cucHoaMi = new CucHoaMi(500, 750, 150);

var drawScene = function() {
    background(207, 250, 255);
    tulip.draw();
    house.draw();
    sunflower.draw();
    cucHoaMi.draw();
};

mouseClicked = function() {
    tulip.growBy(10);
    sunflower.growBy(20);
    cucHoaMi.growBy(5);
    drawScene();
    veTrucToaDo();
};

drawScene();
