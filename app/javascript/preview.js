if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById('image-list');
    
    document.getElementById('item-image').addEventListener('change', function(e){
      //画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.getElementById('image-list');

      if (imageContent){
        imageContent.textContent = null;
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      //画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      //表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.classList.add('img');

      //生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);
    });
  });
}