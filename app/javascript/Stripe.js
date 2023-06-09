// Stripe.js

// 画面の読み込み終了時に以下のコードを動かす
$(window).on("load", function(){

    // gonにより取得したテスト用公開鍵を変数に入れる
    const key = gon.stripe_public_key;

    // 公開鍵を用いてStripeオブジェクトを生成
    // 外部側のStripe.jsから取得できる全ての要素はこのオブジェクトの中に入っている
    const stripe = Stripe(key);

    // Stripeオブジェクトからelementsオブジェクトを生成
    // elementsオブジェクトは、カード情報を入力するフォームを生成するためのUIコンポーネント
    const elements = stripe.elements();

    // カード情報入力フォームのUIを整えるための変数
    const style = {
      base: {
        fontSize: '17px'
      }
    };

    // 上からカード番号、有効期限、cvcの入力スペースを作成している
    // mountでDOM上にそれぞれの入力スペース用要素をアタッチしている
    const cardNumber = elements.create('cardNumber', {style: style});
    cardNumber.mount('#card-number');
    const cardExpiry = elements.create('cardExpiry',{style: style});
    cardExpiry.mount('#card-expiry');
    const cardCvc = elements.create('cardCvc', {style: style, placeholder: ''});
    cardCvc.mount('#card-cvc');

});