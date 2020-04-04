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
//Chèn hình
PImage hinh_nen; //hình nền
PImage grass_block; //cỏ
PImage hang_rao; // hàng rào;
PImage ao_nuoc; //ao nước
PImage via_he; //vỉa hè đá
PImage cloud; //mây bay

void setup()
{
  size(canvas_x ,canvas_y);
  background(125);
  hinh_nen = loadImage("img/background2.jpg");
  grass_block = loadImage("img/grass-block2.png");
  hang_rao = loadImage("img/fence.png");
  ao_nuoc = loadImage("img/pond.png")
  via_he = loadImage("img/rock-pavement1 copy.png")
  cloud = loadImage("img/cloud2.png")
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
  var cucHoaMi_size = 10;
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

/*********************
*Hoa sen Object Type
**********************/
var HoaSen = function(x, y, height) {
  this.x = x;
  this.y = y;
  this.height = height;
}

HoaSen.prototype.draw = function () {
  //biến
  var hoaSen_canhHoa_w = 30;
  var hoaSen_canhHoa_h = 60;
  var hoaSen_tamGiac_w = hoaSen_canhHoa_w/2 -2;
  var hoaSen_tamGiac_x1 = this.x + 5 - hoaSen_tamGiac_w;
  var hoaSen_tamGiac_y1 = this.y - this.height - 10;
  var hoaSen_tamGiac_x2 = this.x + 5;
  var hoaSen_tamGiac_y2 = this.y - this.height - hoaSen_canhHoa_h;
  var hoaSen_tamGiac_x3 = this.x + 5 + hoaSen_tamGiac_w;

  //thân hoa
  noStroke();
  fill(16, 122, 12);
  rect(this.x, this.y, 10, -this.height);

  //cánh hoa
  noStroke();
  // stroke(0);
  fill(255, 51, 153);

  triangle(hoaSen_tamGiac_x1, hoaSen_tamGiac_y1 - 5, hoaSen_tamGiac_x2, hoaSen_tamGiac_y2, hoaSen_tamGiac_x3, hoaSen_tamGiac_y1);
  ellipse(this.x + 5, this.y - this.height - 5, hoaSen_canhHoa_w, hoaSen_canhHoa_h);

  pushMatrix();
  translate(this.x + 5 + hoaSen_canhHoa_w/2, this.y - this.height)
  rotate(PI/4);
  triangle(-hoaSen_canhHoa_w/3 , -20, 0, -50, hoaSen_canhHoa_w/3, -20);
  ellipse(0, 0, hoaSen_canhHoa_w, hoaSen_canhHoa_h);
  popMatrix();

  pushMatrix();
  translate(this.x + 5 - hoaSen_canhHoa_w/2, this.y - this.height)
  rotate(-PI/4);
  triangle(-hoaSen_canhHoa_w/3 , -20, 0, -50, hoaSen_canhHoa_w/3, -20);
  ellipse(0, 0, hoaSen_canhHoa_w, hoaSen_canhHoa_h);
  popMatrix();

  pushMatrix();
  translate(this.x + 5 + hoaSen_canhHoa_w/2, this.y - this.height + hoaSen_canhHoa_h/5)
  rotate(PI/2);
  triangle(-hoaSen_canhHoa_w/3 , -20, 0, -50, hoaSen_canhHoa_w/3, -20);
  ellipse(0, 0, hoaSen_canhHoa_w, hoaSen_canhHoa_h);
  popMatrix();

  pushMatrix();
  translate(this.x + 5 - hoaSen_canhHoa_w/2, this.y - this.height + hoaSen_canhHoa_h/5)
  rotate(-PI/2);
  triangle(-hoaSen_canhHoa_w/3 , -20, 0, -50, hoaSen_canhHoa_w/3, -20);
  ellipse(0, 0, hoaSen_canhHoa_w, hoaSen_canhHoa_h);
  popMatrix();

};

HoaSen.prototype.growBy = function(amount) {
  this.height += amount;
};

/*********************
*Hoa artichoke Object Type
**********************/
var HoaArtichoke = function(x, y, height) {
  this.x = x;
  this.y = y;
  this.height = height;
};

HoaArtichoke.prototype.draw = function () {
  //biến
  var hoaArtichoke_w = 60;
  var hoaArtichoke_h = 20;

  //thân hoa
  noStroke();
  fill(16, 122, 12);
  rect(this.x, this.y, 10, -this.height);

  stroke(0);
  fill(0, 204, 0);

  ellipse(this.x + 5, this.y - this.height, hoaArtichoke_w, hoaArtichoke_h);
  //Tằng trên cùng
  triangle(this.x + 5 - hoaArtichoke_w/2, this.y - this.height, this.x + 5, this.y - this.height - 70, this.x + 5 + hoaArtichoke_w/2, this.y - this.height)

  //2 cánh tầng giữa
  triangle(this.x + 5 - hoaArtichoke_w/2, this.y - this.height, this.x + 5 - hoaArtichoke_w/2 , this.y - this.height - 55, this.x + 5 + hoaArtichoke_w/2, this.y - this.height);
  triangle(this.x + 5 - hoaArtichoke_w/2, this.y - this.height, this.x + 5 + hoaArtichoke_w/2 , this.y - this.height - 55, this.x + 5 + hoaArtichoke_w/2, this.y - this.height);

  //2 cánh đế hoa
  triangle(this.x + 5 - hoaArtichoke_w/2, this.y - this.height, this.x + 5 - hoaArtichoke_w/2 - 10, this.y - this.height - 40, this.x + 5, this.y - this.height);
  triangle(this.x + 5, this.y - this.height, this.x + 5 + hoaArtichoke_w/2 + 10, this.y - this.height - 40, this.x + 5 + hoaArtichoke_w/2, this.y - this.height);
};

HoaArtichoke.prototype.growBy = function(amount) {
  this.height += amount;
};


/*********************
*Cloud Object Type
**********************/

int numCloud = round(random(7,15));
var cloud_x = [random(0, 700)];
var cloud_y = [random(0, 650)];
var cloud_w = [random(200, 300)];
var cloud_h = [(605/1260) * cloud_w[0]];

draw_cloud = function(){
    for(i = 0; i < numCloud; i++){
    cloud_x.push(random(0, 700));
    cloud_y.push(random(20, 150));
    cloud_w.push(random(200, 300));
    cloud_h.push((605/1260) * cloud_w[i+1]);
  }
}

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
    var tayNam_trai_x = thanNha_x + thanNha_w / 2 + thanNha_w / 28;
    var tayNam_phai_x = thanNha_x + thanNha_w / 2 - thanNha_w / 28;
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

var house = new House(450, 450, 300);

var draw_hinhnen = function() {
  var hinh_nen_w = canvas_x + 200;
  var hinh_nen_h = 0.67 * hinh_nen_w
  image (hinh_nen, 0, -100, hinh_nen_w, hinh_nen_h);
};

var draw_grass = function() {
  for (i = canvas_y/2; i < canvas_y; i +=40){
    for (j = 0; j < canvas_x; j += 50.5){
        image(grass_block, j, i, 52, 45.5); //cỏ
    };//for j
   };//for i
   i = 0; j = 0;
};
var draw_hangRao = function() {
    for (i = -20; i < canvas_x; i += 90){
      image(hang_rao, i, 350, 100, 59.42);
    };
};//draw_fence loop
var draw_aoNuoc = function() {
  image(ao_nuoc, 50, 500, 400, 173.94);
};
var draw_viahe = function() {
  for (i = 550; i < 650; i += 100) {
    for (j = 490; j < canvas_y; j += 50){
    image(via_he, i, j, 100, 50);
    };
  }
};

/**********************
/// Vẽ hoa
*********************/
    //Tulips
    int numTulips = random(4,9);
    Tulip[] tulips = new Tulip[numTulips];
    for (int i = 0; i < numTulips; i++){
      tulips[i] = new Tulip(random(50, 400), random(450, 450), random(50, 100));
    }
    //Sunflowrs
    int numSunflowers = random(5, 10);
    Sunflower[] sunflowers = new Sunflower[numSunflowers];
    for(int i = 0; i < numSunflowers; i++){
      sunflowers[i] = new Sunflower(random(50, 500), random(750, 780), random(50, 100));
    }
    // Cúc họa mi bên trái và bên phải đường đi
    int numCucHoaMi = random(10, 30);
    CucHoaMi[] cucHoaMi = new CucHoaMi[numCucHoaMi];
    for(int i = 0; i < numCucHoaMi; i++){
      cucHoaMi[i] = new CucHoaMi(random(500, 550), random(500, 750), random(5, 10));
    }
    int numCucHoaMi_right = random(10, 30);
    CucHoaMi[] cucHoaMi_right = new CucHoaMi[numCucHoaMi_right];
    for(int i = 0; i < numCucHoaMi_right; i++){
      cucHoaMi_right[i] = new CucHoaMi(random(650, 700), random(500, 750), random(5, 10));
    }
    // Hoa sen mọc trong ao
    int numHoaSen = random(1, 3);
    HoaSen[] hoaSen = new HoaSen[numHoaSen];
    for(i = 0; i < numHoaSen; i++){
      hoaSen[i] = new HoaSen(random(60,390), random(590, 640), random(10, 20));
    }
    //Hoa Artichoke
    int numHoaArtichoke = random(4, 9);
    HoaArtichoke[] hoaArtichoke = new HoaArtichoke[numHoaArtichoke];
    for(i = 0; i < numHoaArtichoke; i++){
      hoaArtichoke[i] = new HoaArtichoke(random(50, 500), random(500, 550), random (10, 30));
    }

var drawScene = function() {
    // background(207, 250, 255);
    draw = function() {
      draw_hinhnen();

      //vẽ mây
      draw_cloud();
      for(i = 0; i < numCloud; i++){
        image(cloud, cloud_x[i], cloud_y[i], cloud_w[i], cloud_h[i]);
        cloud_x[i] += 0.3;
        if(cloud_x[i] > canvas_x){
          cloud_x[i] = -5;
        }
      }

      draw_hangRao();
      draw_grass();
      draw_aoNuoc();
      draw_viahe();

      house.draw();

      for (int i = 0; i < numTulips; i++){
        tulips[i].draw();
      };
      for (int i = 0; i < numHoaArtichoke; i++){
        hoaArtichoke[i].draw();
      };
      for (int i = 0; i < numHoaSen; i++){
        hoaSen[i].draw();
      }
      for (int i = 0; i < numSunflowers; i++){
        sunflowers[i].draw();
      };
      for (int i = 0; i < numCucHoaMi; i++){
        cucHoaMi[i].draw();
      };
      for (int i = 0; i < numCucHoaMi_right; i++){
        cucHoaMi_right[i].draw();
      };

      veTrucToaDo();
    };

};

mouseClicked = function() {
//Khi click vào phạm vi đóa hoa thì hoa sẽ mọc cao lên
  //Tulips
  for(int i = 0; i < numTulips; i++){
      if (tulips[i].x - 20 < mouseX &&  mouseX < tulips[i].x + 20){
        if((tulips[i].y - tulips[i].height - 30) < mouseY && mouseY < ((tulips[i].y - tulips[i].height)+20)){
        tulips[i].growBy(random(10, 20))
        }
      }
    }

  //Aritchoke
  for(int i = 0; i < numHoaArtichoke; i++){
      if (hoaArtichoke[i].x - 20 < mouseX &&  mouseX < hoaArtichoke[i].x + 20){
        if((hoaArtichoke[i].y - hoaArtichoke[i].height - 30) < mouseY && mouseY < ((hoaArtichoke[i].y - hoaArtichoke[i].height)+20)){
        hoaArtichoke[i].growBy(random(10, 20))
        }
      }
    }
  //Hoa sen
  for(int i = 0; i < numHoaSen; i++){
      if (hoaSen[i].x - 20 < mouseX &&  mouseX < hoaSen[i].x + 20){
        if((hoaSen[i].y - hoaSen[i].height - 30) < mouseY && mouseY < ((hoaSen[i].y - hoaSen[i].height)+20)){
        hoaSen[i].growBy(random(10, 20))
        }
      }
    }
  //Hoa Hướng Dương
  for(int i = 0; i < numSunflowers; i++){
      if (sunflowers[i].x - 20 < mouseX &&  mouseX < sunflowers[i].x + 20){
        if((sunflowers[i].y - sunflowers[i].height - 30) < mouseY && mouseY < ((sunflowers[i].y - sunflowers[i].height)+20)){
        sunflowers[i].growBy(random(10, 20))
        }
      }
    }
    //Cúc họa mi trái và phải đường đi
    for(int i = 0; i < numCucHoaMi; i++){
        if (cucHoaMi[i].x - 20 < mouseX &&  mouseX < cucHoaMi[i].x + 20){
          if((cucHoaMi[i].y - cucHoaMi[i].height - 30) < mouseY && mouseY < ((cucHoaMi[i].y - cucHoaMi[i].height)+20)){
          cucHoaMi[i].growBy(random(10, 15))
          }
        }
      }

    for(int i = 0; i < numCucHoaMi_right; i++){
        if (cucHoaMi_right[i].x - 20 < mouseX &&  mouseX < cucHoaMi_right[i].x + 20){
          if((cucHoaMi_right[i].y - cucHoaMi_right[i].height - 30) < mouseY && mouseY < ((cucHoaMi_right[i].y - cucHoaMi_right[i].height)+20)){
          cucHoaMi_right[i].growBy(random(10, 20))
          }
        }
      }

    drawScene();

};

drawScene();
