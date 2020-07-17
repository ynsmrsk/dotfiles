import Head from 'next/head'
import Link from 'next/link'
import Nav from '../components/nav'

export default function Home() {
  return (
    <div className="container">
      <Head>
        <title>Create Next App</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

			<div className="hero">
				<h1 className='hero-title'>Yunus Emre Işık</h1>
				<div className='hero-social-links'>
					<Link href='//www.twitter.com/Ynsmrska'><a className='social-link'>Twitter</a></Link>
					<Link href='//www.instagram.com/ynsmrska/'><a className='social-link'>Instagram</a></Link>
					<Link href='//www.github.com/ynsmrsk'><a className='social-link'>Github</a></Link>
				</div>
			</div>

			<div className="blog">
				<h2 className='blog-title'>
					<Link href='/[postid]'>
						<a className='blog-title-link'>İyi bir mühendisin 10 özelliği</a>
					</Link>
				</h2>
				<div className='blog-text'>
					Uber’de engineering manager (mühendis müdürü) olarak çalışan Dan Heller’ın kendi blogunda ‘Ten Principles for Growth as an Engineer’ başlığıyla paylaştığı yazıyı çok etkili buldum. Kendim defalarca okudum, sizlerinde bundan faydalanmasını istiyorum. Eğer ingilizcenin yeteri seviyedeyse orjinalini okumanızı tavsiye ediyorum.
					Yazıyı beğendiğiniz ve faydalı bulduğunuz takdirde takım arkadaşlarınızla, sizinle çalışan mühendislerle paylaşmanızı öneririm. Bir mühendis çoğu zaman takımının ortalamasından daha ileriye gidemiyor. Etrafınızdakilerin gelişimine katkı sağlamak uzun vadede sizi de ileriye götürecek, bunu unutmamak lazım. Son olarak yazının aslına sadık kalmaya çalıştım, fakat bazı noktalarda kelime seçiminde insiyatif kullandım. İyi okumalar.
				</div>
				<div className='blog-date'>17 Temmuz 2020</div>
			</div>

			<style jsx>{`
				.container {
					max-width: 650px;
					width: 100%;
					margin: 0 auto;
				}

				.hero {
					text-align: center;
				}
			`}</style>
    </div>
  )
}
