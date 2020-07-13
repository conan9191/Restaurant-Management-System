$(function() {
    var MAX = 99,
        MIN = 1;

    $('#btn-cart').on('click', function() {
        $.ajax({
            type: "GET",
            url: '/item/getCart',
            success: function(data) {

                var target = $("#cart > .weui-popup__modal > .toolbar > #template");
                $(
                        '#cart > .weui-popup__modal > .modal-content')
                    .empty();
                // 判断data是否为空
                if (data == "") {
                    $(
                            '#cart > .weui-popup__modal > .modal-content')
                        .html("您的购物车为空");
                } else {
                    $.each(
                        data.items,
                        function(n, value) {
                            var new_target = target
                                .clone();

                            new_target
                                .find(
                                    "#item-id")
                                .val(
                                    value.item.id);
                            new_target
                                .find(
                                    "#caritem-img")
                                .attr(
                                    "src",
                                    value.item.path +
                                    value.item.filename);
                            new_target
                                .find(
                                    "#caritem-name")
                                .html(
                                    value.item.name);
                            new_target
                                .find(
                                    ".price")
                                .html(
                                    "￥" +
                                    value.item.price);
                            new_target
                                .find(
                                    ".weui-count__number")
                                .val(
                                    value.quantity);
                            $(
                                    '#cart > .weui-popup__modal > .modal-content')
                                .append(
                                    new_target);
                        });
                    $(
                            '#cart > .weui-popup__modal > .modal-content')
                        .find("#template").css(
                            "display", "block");
                }

                $('#cart').find("#cart-total-quantity")
                    .html(data.totalQuantity);
                $('#cart').find("#cart-total-price")
                    .html(data.totalPrice);
                $('.weui-cell_swiped').swipeout();

                $('#cart > .weui-popup__modal > .modal-content').find(".weui-swiped-btn").on('click', function() {
                    $.ajax({
                        type: "GET",
                        url: '/item/removeCartItem',
                        data: {
                            id: $(this).parent().parent().find('#item-id').val()
                        },
                        success: function(
                            data) {
                            $('#cart').find("#cart-total-quantity").html(data.totalQuantity);
                            $('#cart').find("#cart-total-price").html(data.totalPrice);
                            layer.msg("移除成功!");
                        },
                        error: function() {
                            layer
                                .msg("服务器忙，请稍等。");
                        }
                    });

                    $(this).parent()
                        .parent()
                        .parent()
                        .remove();

                });


            },
            error: function(request) {
                /* layer.msg("服务器正忙，请稍后再试！"); */
            }
        });

    });

    /*
     * 进入这个网页将所有商品遍历出来
     */
    $.ajax({
        type: "GET",
        url: '/item/getItems',
        data: {

        },
        success: function(data) {
            var target = $("#tab1 .navi-left").find("#template");
            $("#tab1 .item-wrapper").empty();

            for (var i = 0; i < data.length; i++) {
                var new_target = target.clone();

                new_target.find(".cover_image").attr("src",
                    data[i].path + data[i].filename);
                new_target.find(".item-name").html(
                    "<span>" + data[i].name + "</span>");
                new_target.find(".item-price")
                    .html(
                        "价格: <span class='price'>" + data[i].price +
                        "￥</span>");
                new_target.find(".item-sale").html("销售量: " + data[i].sale);
                new_target.find(".item-operation a").html("添加到购物车");
                new_target.find('.item-id').val(data[i].id);

                $("#tab1 .item-wrapper").append(new_target);

                $("#tab1 .item-wrapper").find('.weui-count').css("display", "block");
            }

            $("#tab1 .item-wrapper").find('.weui-count').css("display", "block");
            $("#tab1 .item-wrapper").find('.weui-count__decrease').click(
                function(e) {
                    var $input = $(e.currentTarget).parent().find(
                        '.weui-count__number');
                    var number = parseInt($input.val() || "0") - 1;
                    if (number < MIN)
                        number = MIN;
                    $input.val(number);
                });

            $('.weui-count__increase').on('click', function(e) {
                var $input = $(e.currentTarget).parent().find(
                    '.weui-count__number');
                var number = parseInt($input.val() || "0") + 1;
                if (number > MAX)
                    number = MAX;
                $input.val(number);
            });

            /*
             * 添加商品至购物车 事件
             */
            $('#tab1 .item-wrapper').find('#add-cart-item').on('click', function(e) {
                var id = $(e.currentTarget).parent().parent().find('.item-id').val();
                var number = $(e.currentTarget).parent().parent().find('.weui-count__number').val();
                $.ajax({
                    url: 'item/addCartItem',
                    type: 'get',
                    data: {
                        id: id,
                        number: number
                    },
                    success: function() {
                        layer.msg('添加成功，请在购物车中查看！');
                    },
                    error: function() {
                        layer.msg("系统繁忙,请稍后再试");
                    }
                });
            });


        },
        error: function(request) {
            layer.msg("服务器正忙，请稍后再试！");
        }
    });

    /*
     * 订单提交
     */
    $('#cart').find("#btn-genOrder").on('click', function() {
        $.ajax({
            type: "GET",
            url: '/itemOrder/orderCommit',
            success: function(data) {
                $('#cart').find("#btn-genOrder")
                    .addClass("weui-btn_loading");
                /* alert(1); */
                if (data == 0) {
                    layer.msg("您还未登陆！请登陆后再进行此操作");
                    // alert(1);
                    setTimeout(function() {
                        window.location.href = "/login"
                    }, 2000);
                    return;
                } else if (data == -1) {
                    layer.msg("您的购物车没有东西");
                    return;
                } else {
                    // alert(2);
                    layer.msg("提交成功!");
                    setTimeout(
                        function() {
                            window.location.href = "/itemOrder/StartAlipayForItem?id=" +
                                data;
                        }, 1000);
                }
            },
            error: function() {
                layer.msg("系统繁忙,请稍等.");
            }
        });

    });
    /*
     * 读取session中的user
     */
    $.ajax({
        url: "/admin/getUser",
        type: "get",
        success: function(data) {
            $('#header').find('#user-name').html(data.nickname);
            $('#header').find('#user-id').val(data.id);
        },
        error: function() {
            layer.msg("服务器繁忙");
        }
    });

});

function showItemList(id) {
    $.ajax({
        type: "GET",
        url: '/item/getItemByItemType',
        data: {
            id: id
        },
        success: function(data) {
            var MAX = 99,
                MIN = 1;
            var target = $("#tab1 .navi-left").find("#template");
            $("#tab1 .item-wrapper").empty();

            for (var i = 0; i < data.length; i++) {
                var new_target = target.clone();

                new_target.find(".cover_image").attr("src",
                    data[i].path + data[i].filename);
                new_target.find(".item-name").html("菜品: " + data[i].name);
                new_target.find(".item-price").html(
                    "价格: " + data[i].price + "元");
                new_target.find(".item-sale").html("销售量: " + data[i].sale);
                new_target.find(".item-operation a").html("添加到购物车");
                new_target.find('.item-id').val(data[i].id);

                $("#tab1 .item-wrapper").append(new_target);

            }

            $("#tab1 .item-wrapper").find('.weui-count').css("display", "block");
            $("#tab1 .item-wrapper").find('.weui-count__decrease').click(
                function(e) {
                    var $input = $(e.currentTarget).parent().find(
                        '.weui-count__number');
                    var number = parseInt($input.val() || "0") - 1;
                    if (number < MIN)
                        number = MIN;
                    $input.val(number);
                });

            $('.weui-count__increase').on('click', function(e) {
                var $input = $(e.currentTarget).parent().find(
                    '.weui-count__number');
                var number = parseInt($input.val() || "0") + 1;
                if (number > MAX)
                    number = MAX;
                $input.val(number);
            });

            /*
             * 添加商品至购物车 事件
             */
            $('#tab1 .item-wrapper').find('#add-cart-item').on('click', function(e) {
                var id = $(e.currentTarget).parent().parent().find('.item-id').val();
                var number = $(e.currentTarget).parent().parent().find('.weui-count__number').val();
                $.ajax({
                    url: 'item/addCartItem',
                    type: 'get',
                    data: {
                        id: id,
                        number: number
                    },
                    success: function() {
                        layer.msg('添加成功，请在购物车中查看！');
                    },
                    error: function() {
                        layer.msg("系统繁忙,请稍后再试");
                    }
                });
            });
        },
        error: function(request) {
            layer.msg("服务器正忙，请稍后再试！");
        }
    });
}
/*
 * 商品添加到购物车
 */
function addCartItem(id) {
    $.ajax({
        type: "GET",
        url: '/item/addCartItem',
        data: {
            id: id
        },
        success: function(data) {
            layer.msg("添加成功！请在购物车中查看！");
        },
        error: function(request) {
            layer.msg("服务器正忙，请稍后再试！");
        }
    });
}