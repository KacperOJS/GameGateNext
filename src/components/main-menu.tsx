import Image from "next/image";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Button } from "./ui/button";
import Link from "next/link";
import "../components/menu.css"; // Assuming styles are in a global CSS file

export default function MainMenu() {
  return (
    <>
      <Accordion type="single" collapsible className="main-menu__accordion">
        <AccordionItem value="item-1" className="main-menu__accordion-item">
          <AccordionTrigger className="main-menu__accordion-trigger">
            <div className="flex flex-row gap-2 items-center">
              {/* <Image src={'/icons/icon-news.gif'} width={24} height={24} alt="Premium" /> */}
              News
            </div>
          </AccordionTrigger>
        </AccordionItem>

        <AccordionItem value="item-2" className="main-menu__accordion-item">
          <AccordionTrigger className="main-menu__accordion-trigger">
            <div className="flex flex-row gap-2 items-center">
              <Image
                src={"/icons/icon-community.gif"}
                width={24}
                height={24}
                alt="Premium"
              />
              Community
            </div>
          </AccordionTrigger>
          <AccordionContent className="main-menu__accordion-content">
            <div className="flex flex-col space-y-1 mt-1 p-2">
              <Button asChild className="main-menu__button">
                <Link href={"/characters"}>Characters</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/online"}>Who&apos;s Online</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/highscores"}>Highscores</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/guilds"}>Guilds</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/last-kills"}>Last Kills</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/support-list"}>Support List</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/casts"}>Casts</Link>
              </Button>
            </div>
          </AccordionContent>
        </AccordionItem>

        <AccordionItem value="item-3" className="main-menu__accordion-item">
          <AccordionTrigger className="main-menu__accordion-trigger">
            <div className="flex flex-row gap-2 items-center">
              <Image
                src={"/icons/icon-library.gif"}
                width={24}
                height={24}
                alt="Premium"
              />
              Library
            </div>
          </AccordionTrigger>
          <AccordionContent className="main-menu__accordion-content">
            <div className="flex flex-col space-y-1 mt-1 p-2">
              <Button asChild className="main-menu__button">
                <Link href={"/server-info"}>Server Infos</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/loyalty"}>Loyalty</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/rules"}>Rules</Link>
              </Button>
            </div>
          </AccordionContent>
        </AccordionItem>

        <AccordionItem value="item-4" className="main-menu__accordion-item">
          <AccordionTrigger className="main-menu__accordion-trigger">
            <div className="flex flex-row gap-2 items-center">
              <Image
                src={"/icons/icon-shops.gif"}
                width={24}
                height={24}
                alt="Premium"
              />
              Shop
            </div>
          </AccordionTrigger>
          <AccordionContent className="main-menu__accordion-content">
            <div className="flex flex-col space-y-1 mt-1 p-2">
              <Button asChild className="main-menu__button">
                <Link href={"/shop"}>Buy Coins</Link>
              </Button>
              <Button asChild className="main-menu__button">
                <Link href={"/character-market"}>Character Market</Link>
              </Button>
            </div>
          </AccordionContent>
        </AccordionItem>
      </Accordion>
    </>
  );
}
