<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="hb_game" class="Game">
        <form name="newForm" id="newForm" action="/member/Grp/grpOrder.php" method="post">
            <!--正码1-6选择-->
            <div id="tab" style="display:none;">
                <ul>
                    <li data-rtypen="N1" class="onTagClick"><span><b>正码特 1</b></span></li>
                    <li data-rtypen="N2" class="unTagClick"><span><b>正码特 2</b></span></li>
                    <li data-rtypen="N3" class="unTagClick"><span><b>正码特 3</b></span></li>
                    <li data-rtypen="N4" class="unTagClick"><span><b>正码特 4</b></span></li>
                    <li data-rtypen="N5" class="unTagClick"><span><b>正码特 5</b></span></li>
                    <li data-rtypen="N6" class="unTagClick"><span><b>正码特 6</b></span></li>
                    <li id="space" style="width:15px;"></li>
                </ul>
            </div>
            <div id="quickMode">
                <input type="button" name="quickinput" value="切换一般模式" id="switchMode">
            </div>
            <div class="round-table">
                <table id="table1">
                    <tbody>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;" class="title_tr">
                        <td style="font-size: 8pt; width: 90px;">半波</td>
                        <td style="font-size:8pt;">赔率</td>
                        <td style="font-size:8pt;">金额</td>
                        <td style="font-size:8pt;" colspan="10">号码</td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红单</span></td>
                        <td style="font-size:8pt;" id="HB_RODD_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_RODD">5.61</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_RODD]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_RODD]" value="5.61"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>01</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>07</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>13</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>19</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>23</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>29</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>35</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>45</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红双</span></td>
                        <td style="font-size:8pt;" id="HB_REVEN_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_REVEN">5.06</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_REVEN]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_REVEN]" value="5.06"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>02</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>08</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>12</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>18</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>24</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>30</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>34</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>40</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>46</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红大</span></td>
                        <td style="font-size:8pt;" id="HB_ROVER_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_ROVER">6.51</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_ROVER]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_ROVER]" value="6.51"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>29</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>30</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>34</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>35</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>40</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>45</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>46</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红小</span></td>
                        <td style="font-size:8pt;" id="HB_RUNDER_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_RUNDER">4.51</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_RUNDER]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_RUNDER]" value="4.51"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>01</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>02</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>07</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>08</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>12</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>13</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>18</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>19</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>23</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>24</span></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿单</span></td>
                        <td style="font-size:8pt;" id="HB_GODD_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_GODD">5.61</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_GODD]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_GODD]" value="5.61"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>05</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>11</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>17</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>21</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>27</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>33</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>39</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>43</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿双</span></td>
                        <td style="font-size:8pt;" id="HB_GEVEN_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_GEVEN">6.51</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_GEVEN]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_GEVEN]" value="6.51"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>06</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>16</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>22</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>28</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>32</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>38</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>44</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿大</span></td>
                        <td style="font-size:8pt;" id="HB_GOVER_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_GOVER">5.61</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_GOVER]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_GOVER]" value="5.61"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>27</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>28</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>32</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>33</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>38</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>39</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>43</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>44</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿小</span></td>
                        <td style="font-size:8pt;" id="HB_GUNDER_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_GUNDER">6.51</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_GUNDER]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_GUNDER]" value="6.51"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>05</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>06</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>11</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>16</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>17</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>21</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>22</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝单</span></td>
                        <td style="font-size:8pt;" id="HB_BODD_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_BODD">5.61</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_BODD]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_BODD]" value="5.61"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>03</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>09</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>15</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>25</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>31</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>37</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>41</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>47</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝双</span></td>
                        <td style="font-size:8pt;" id="HB_BEVEN_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_BEVEN">5.61</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_BEVEN]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_BEVEN]" value="5.61"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>04</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>10</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>14</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>20</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>26</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>36</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>42</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>48</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝大</span></td>
                        <td style="font-size:8pt;" id="HB_BOVER_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_BOVER">5.06</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_BOVER]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_BOVER]" value="5.06"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>25</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>26</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>31</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>36</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>37</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>41</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>42</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>47</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>48</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝小</span></td>
                        <td style="font-size:8pt;" id="HB_BUNDER_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HB_BUNDER">6.51</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HB_BUNDER]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HB_BUNDER]" value="6.51"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>03</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>04</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>09</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>10</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>14</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>15</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>20</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="round-table">
                <table id="table2">
                    <tbody>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;" class="title_tr">
                        <td style="font-size:8pt;width:110px">半半波</td>
                        <td style="font-size:8pt;">赔率</td>
                        <td style="font-size:8pt;">金额</td>
                        <td style="font-size:8pt;" colspan="5">号码</td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红大单</span></td>
                        <td style="font-size:8pt;" id="HH_ROO_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_ROO">14.8</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_ROO]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_ROO]" value="14.8"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>29</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>35</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>45</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红大双</span></td>
                        <td style="font-size:8pt;" id="HH_ROE_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_ROE">11.1</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_ROE]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_ROE]" value="11.1"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>30</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>34</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>40</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>46</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红小单</span></td>
                        <td style="font-size:8pt;" id="HH_RUO_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_RUO">8.9</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_RUO]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_RUO]" value="8.9"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>01</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>07</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>13</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>19</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>23</span></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>红小双</span></td>
                        <td style="font-size:8pt;" id="HH_RUE_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_RUE">8.9</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_RUE]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_RUE]" value="8.9"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>02</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>08</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>12</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>18</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorR">
                            <span>24</span></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿大单</span></td>
                        <td style="font-size:8pt;" id="HH_GOO_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_GOO">11.1</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_GOO]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_GOO]" value="11.1"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>27</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>33</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>39</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>43</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿大双</span></td>
                        <td style="font-size:8pt;" id="HH_GOE_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_GOE">11.1</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_GOE]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_GOE]" value="11.1"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>28</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>32</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>38</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>44</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿小单</span></td>
                        <td style="font-size:8pt;" id="HH_GUO_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_GUO">11.1</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_GUO]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_GUO]" value="11.1"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>05</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>11</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>17</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>21</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>绿小双</span></td>
                        <td style="font-size:8pt;" id="HH_GUE_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_GUE">14.8</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_GUE]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_GUE]" value="14.8"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>06</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>16</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorG">
                            <span>22</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝大单</span></td>
                        <td style="font-size:8pt;" id="HH_BOO_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_BOO">8.9</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_BOO]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_BOO]" value="8.9"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>25</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>31</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>37</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>41</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>47</span></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝大双</span></td>
                        <td style="font-size:8pt;" id="HH_BOE_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_BOE">11.1</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_BOE]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_BOE]" value="11.1"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>26</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>36</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>42</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>48</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝小单</span></td>
                        <td style="font-size:8pt;" id="HH_BUO_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_BUO">14.8</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_BUO]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_BUO]" value="14.8"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>03</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>09</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>15</span></td>
                        <td style="background-color:#fff;"></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;height:30px;">
                        <td style="font-size:8pt;" class="title_td2"><span>蓝小双</span></td>
                        <td style="font-size:8pt;" id="HH_BUE_bg"><span
                                style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                id="HH_BUE">11.1</span></td>
                        <td style="font-size:8pt;"><input type="text" class="GoldQQ" pattern="[0-9]*"
                                                          name="gold[HH_BUE]" min="0" max="99999999"
                                                          data-callback-id="6" maxlength="8"
                                                          style="border: 1px solid rgb(187, 187, 187);"><input
                                type="hidden" name="odds[HH_BUE]" value="11.1"></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>04</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>10</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>14</span></td>
                        <td style="font-size: 8pt; background-color: rgb(255, 255, 255);" class="bColorB">
                            <span>20</span></td>
                        <td style="background-color:#fff;"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="round-table" style="display: none;">
                <table id="table3"></table>
            </div>
            <div class="round-table" style="display: none;">
                <table id="table4"></table>
            </div>
            <div class="SendLT Send">
                <span class="credit">下注金额:<b id="total_bet">0.00</b></span>
                <input class="no" type="reset" value="取消">
                <input class="yes" type="button" name="btnBet" value="确定">
            </div>
            <input type="hidden" name="gid" id="gid" value="551082">
            <input type="hidden" name="Line" id="Line" value="">
        </form>
    </div>
</div>

<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lhc_lm.js?51188" type="text/javascript"></script>
<script type="application/javascript">
//获取彩池
var itemInfo = "";
$.ajax({url: "${ctx}/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=1,3,4",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#orders").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href=ctx+"logout.do";
        }
    }
});
//获取降水
function getDownRateInfo(){
 $.ajax({
 	url: "${ctx}/lhc/getDownRate.do?timeStamp=" + new Date().getTime()+"&poolId=1,3,4",
		type: "get",
		dataType: "json",
     success: function(b) {
     	if(0 == b.code && b.list != null && b.list != undefined && b.list != ''){
     		var list = b.list;
     		$.each(list, function(n,value) {
    				if(value.payrule != null && value.payrule != undefined && value.payrule != '' &&value.payrule.length > 0){
    					var itemcode = value.itemcode;
    					var position = value.payrule
        				var input$ = $("input[data-itemcode="+itemcode+"][data-position="+position+"]");
        				//console.debug(itemInfo);
        				var num = itemInfo.items_map[itemcode].odds.toFixed(2);
        				//console.debug(num);
        				rate = (num - value.downrate).toFixed(2);
        				input$.siblings(".odds").html(rate);
        			}else{
        				var itemcode = value.itemcode;
        				var input$ = $("input[data-itemcode="+value.itemcode+"]");
        				var num = itemInfo.items_map[itemcode].odds.toFixed(2);
        				//console.debug(num);
        				rate = (num - value.downrate).toFixed(2);
        				input$.siblings(".odds").html(rate);
        			}
        		});
     		}
		}
    });
}
$(document).ready(function(){
	getDownRateInfo();
	setInterval(getDownRateInfo, 10000);
});


</script>
</body>
</html>
