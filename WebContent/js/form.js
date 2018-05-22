/**
 * Created by Bainan on 2017/7/23.
 */
function getDataByForm(form) {
    var data = '';
    var input = form.getElementsByTagName('input');
    var select = form.getElementsByTagName('select');
    for (var i = 0; i < input.length; i++) {
        data += input[i].name + '=' + input[i].value + '&';
    }
    for (var i = 0; i < select.length; i++) {
        data += select[i].name + '=' + select[i].value + '&';
    }
    data = data.substr(0, data.lastIndexOf('&'));
    return data;
}